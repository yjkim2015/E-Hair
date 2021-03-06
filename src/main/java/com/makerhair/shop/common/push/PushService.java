package com.makerhair.shop.common.push;

import com.makehair.shop.common.constants.PushVo;

public interface PushService {

	/**
	 * push 메소드
	 * @param pushVo
	 */
	public void push(final PushVo pushVo);
	
	/**
	 * 특정 User에게 push
	 * @param user
	 * @param pushVo
	 */
	public void pushTo(final String user, final PushVo pushVo);
}
