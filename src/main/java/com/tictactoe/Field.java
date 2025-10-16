package com.tictactoe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Field {
    private final Map<Integer, Sign> field;

    public Field() {
        field = new HashMap<>();
        for (int i = 0; i < 9; i++) {
            field.put(i, Sign.EMPTY);
        }
    }

    public Map<Integer, Sign> getField() {
        return field;
    }

    public int getEmptyFieldIndex() {
        return field.entrySet().stream()
                .filter(e -> e.getValue() == Sign.EMPTY)
                .map(Map.Entry::getKey)
                .findFirst().orElse(-1);
    }

    public List<Sign> getFieldData() {
        return field.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());
    }

    public Sign checkWin() {
        List<List<Integer>> winPossibilities = List.of(
                List.of(0, 1, 2),
                List.of(3, 4, 5),
                List.of(6, 7, 8),
                List.of(0, 3, 6),
                List.of(1, 4, 7),
                List.of(2, 5, 8),
                List.of(0, 4, 8),
                List.of(2, 4, 6)
        );

        for (List<Integer> winPossibility : winPossibilities) {
            Sign first = field.get(winPossibility.get(0));
            if (first != Sign.EMPTY &&
                    first == field.get(winPossibility.get(1)) &&
                    first == field.get(winPossibility.get(2))) {
                return first;
            }
        }
        return Sign.EMPTY;
    }

    public int getAIMove() {
        int winIndex = getWinningIndex(Sign.NOUGHT);
        if (winIndex != -1) return winIndex;
        int blockIndex = getWinningIndex(Sign.CROSS);
        if (blockIndex != -1 && Math.random() < 0.5) return blockIndex;

        return getEmptyFieldIndex();
    }

    private int getWinningIndex(Sign sign) {
        List<List<Integer>> winPossibilities = List.of(
                List.of(0, 1, 2),
                List.of(3, 4, 5),
                List.of(6, 7, 8),
                List.of(0, 3, 6),
                List.of(1, 4, 7),
                List.of(2, 5, 8),
                List.of(0, 4, 8),
                List.of(2, 4, 6)
        );

        for (List<Integer> combo : winPossibilities) {
            Sign a = field.get(combo.get(0));
            Sign b = field.get(combo.get(1));
            Sign c = field.get(combo.get(2));

            if (a == sign && b == sign && c == Sign.EMPTY) return combo.get(2);
            if (a == sign && b == Sign.EMPTY && c == sign) return combo.get(1);
            if (a == Sign.EMPTY && b == sign && c == sign) return combo.get(0);
        }
        return -1;
    }
}
