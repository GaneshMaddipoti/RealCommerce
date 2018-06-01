package web.util;

import java.util.Comparator;

import web.data.model.AbstractEntity;

public class RankComparator<T> implements Comparator<T> {

	public int compare(T o1, T o2) {
		try {
			if (((AbstractEntity) o1).getRank() < ((AbstractEntity) o2).getRank()) {
				return -1;
			} else if (((AbstractEntity) o1).getRank() > ((AbstractEntity) o2).getRank()) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}
	}

}
