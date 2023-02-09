Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8695CC636D4
	for <ath10k@archiver.kernel.org>; Thu,  9 Feb 2023 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cufK4C7t2MRbicH+L+RZoERMsgtgNqUa8QjkL2JUWr0=; b=illKG4V5ZwVV38
	K+1iPYgdH3jrFl/43yH5oL3HZBrmzNJUusC6F5v/XJvytGNvrqaNcx0KwTNWfGDxLwftSliOTEH3h
	03kImsRjR+8ZUhSmy7jDaVA7uZWW1EOMooOpuWRaCSAQJunqCqbpQz3iCGIGW0jkrlZBxDwfVxr9R
	OmFq5PSKXeGEbHsZiuYlp1KIhMfEkMPsQt+ePF/E4l2+qAvQEDERftp1xb+eeJ9wXL8zUkICG8CcJ
	tqYZUCDqyvldUr/7r6d2MvveZJJdzxedtnvH67AAv+tju9XJh2JpgyQSpGEI2WoyMd+UIY051xbEv
	frjCJLz7cNJndGiqzrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBZa-002pDv-GP; Thu, 09 Feb 2023 18:23:06 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBZX-002pBq-1l
	for ath10k@lists.infradead.org; Thu, 09 Feb 2023 18:23:05 +0000
Received: by mail-qt1-x831.google.com with SMTP id cr22so2960285qtb.10
        for <ath10k@lists.infradead.org>; Thu, 09 Feb 2023 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTfzY/Chfs7uqsAiNDpZ6trUEll/L71CbJHJALFQZM4=;
        b=DJLHE80cm2ZtcScbPjB3jkl1zPCVeS9NEMKViyY+OTpQLwK6D0kg6ElVae4AKU+Jka
         SL90Vfbk8qTR3pv34qEO9KUGIbs9ebJdXWsPNSVfLzkUyxq6yMiSzxKIjPwEsAxt8ixh
         /avGwCoJmwamxNuQ7t6t0aXK/VczWGZmzLApZmBAwGbB/yOajj2PJHYjhY8GvKh5aoaX
         sOrpAxqgzLC3V7xn4atGu8ox3Twpu6PiDnbdidfhYAV4Up0w8MQ/YJqh/AHf9G+L0woQ
         Ok+MCxGY5UyofFCk091V1XqjXmz5RN/HabbFHxwl9pGHseR9iVNXQEy82zzFhkmQq/b9
         LsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTfzY/Chfs7uqsAiNDpZ6trUEll/L71CbJHJALFQZM4=;
        b=HltHVZPCWPMO0boR8KDJKG3AJochQfQmF1qJ/Est8rSD5f5Qag56k81ML7Bt6sB05W
         ExnrNuXNL0M5CuNb0fY1v4x+mynzuld08E2xygayJJZ0Nh4K3Y/wKv4eX+zjaDTOk8KW
         C+83B+gOnMxNA+x8F8I5IqnK8Y50ofk8Wv6R8wNPRKr4/iio7TTgRjvlbQJbHsC2CnmX
         m41t0eirj5wDUFF7mpAo1FfuJFsvBSW3dhwWkxsVKfGEQLxfYP+G0wT4x7XY0jPgFywx
         Rf1uJqjoG3q+oJxueHDxdDBPKiFCM5rA/1hrFMOR44Ic8EZVirCc3YMEuS0RzkhrOp4T
         WNZw==
X-Gm-Message-State: AO0yUKXpc732IWxKnD8YzaMKn4zoRi8vn1Lav7elodvd+Y2cqIgiIRlb
	wNjDfG04gHWOaI+JYdTo1Ml1ULxr3rBhGfyoQ/2rTA==
X-Google-Smtp-Source: AK7set8h+mdHWWDG4oLkSXScXaXN0cqzbhlR6uKGYD/Kkjxgn8UPf05SLjNs0A3Mgg8gR3fUoGHSuYUgsGUadNOQpDk=
X-Received: by 2002:ac8:5783:0:b0:3b8:6a00:87ca with SMTP id
 v3-20020ac85783000000b003b86a0087camr2389017qta.81.1675966980408; Thu, 09 Feb
 2023 10:23:00 -0800 (PST)
MIME-Version: 1.0
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 9 Feb 2023 23:52:24 +0530
Message-ID: <CAMi1Hd3hYo00ieqWNJyXzBmknKkb1y76T8xKUVZBJGXMvRSpNg@mail.gmail.com>
Subject: ath10k: wcn3990: hitting kernel warnings while running hostapd
To: Kalle Valo <kvalo@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
	ath10k <ath10k@lists.infradead.org>, linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_102303_157474_24BC6A22 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I'm using WiFi hotspot (hostapd) on Dragonboard 845c
(sdm845|ath10k|wcn3990) running AOSP, and I run into following
non-fatal warnings when a station disassociates from the AP. I wanted
to raise the issue in case anyone had ideas what might be going wrong.
Any known issues? I can reproduce similar warnings all the way to
v5.15.y (or may be older LTS versions as well but didn't try yet).

--------------------->8----------8<------------------
[ 9759.346966][ T1989] ath10k_snoc 18800000.wifi: failed to install
key for vdev 0 peer 8a:55:b5:61:9c:a7: -110
[ 9759.356962][ T1989] wlan0: failed to remove key (0,
8a:55:b5:61:9c:a7) from hardware (-110)
[ 9759.394757][ T1989] ath10k_snoc 18800000.wifi: cipher 0 is not supported
[ 9759.401548][ T1989] ath10k_snoc 18800000.wifi: failed to remove
peer wep key 0: -95
[ 9759.409545][ T1989] ath10k_snoc 18800000.wifi: failed to clear all
peer wep keys for vdev 0: -95
[ 9759.418574][ T1989] ath10k_snoc 18800000.wifi: failed to
disassociate station: 8a:55:b5:61:9c:a7 vdev 0: -95
[ 9759.428742][ T1989] ------------[ cut here ]------------
[ 9759.434103][ T1989] WARNING: CPU: 3 PID: 1989 at
net/mac80211/sta_info.c:1307 __sta_info_destroy_part2+0x108/0x150
........
[ 9759.721639][ T1989] CPU: 3 PID: 1989 Comm: hostapd Tainted: G
     E      6.2.0-rc7-mainline-00015-gdc06692108da #1
[ 9759.732680][ T1989] Hardware name: Thundercomm Dragonboard 845c (DT)
[ 9759.739088][ T1989] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[ 9759.746812][ T1989] pc : __sta_info_destroy_part2+0x108/0x150
[ 9759.752620][ T1989] lr : __sta_info_destroy_part2+0x6c/0x150
..............
[ 9759.841441][ T1989] Call trace:
[ 9759.844616][ T1989]  __sta_info_destroy_part2+0x108/0x150
[ 9759.850069][ T1989]  __sta_info_destroy+0x2c/0x40
[ 9759.854826][ T1989]  sta_info_destroy_addr_bss+0x34/0x58
[ 9759.860189][ T1989]  ieee80211_del_station+0x1c/0x40
[ 9759.865208][ T1989]  nl80211_del_station+0xdc/0x250
[ 9759.870136][ T1989]  genl_family_rcv_msg_doit.isra.0+0xbc/0x128
[ 9759.876119][ T1989]  genl_rcv_msg+0x1f0/0x280
[ 9759.880529][ T1989]  netlink_rcv_skb+0x58/0x138
[ 9759.885112][ T1989]  genl_rcv+0x38/0x50
[ 9759.888990][ T1989]  netlink_unicast+0x1cc/0x298
[ 9759.893659][ T1989]  netlink_sendmsg+0x1d8/0x448
[ 9759.898328][ T1989]  sock_sendmsg+0x4c/0x58
[ 9759.902562][ T1989]  ____sys_sendmsg+0x314/0x3a8
[ 9759.907226][ T1989]  ___sys_sendmsg+0x80/0xc8
[ 9759.911634][ T1989]  __sys_sendmsg+0x68/0xc8
[ 9759.915946][ T1989]  __arm64_sys_sendmsg+0x24/0x30
[ 9759.920787][ T1989]  invoke_syscall+0x44/0x108
[ 9759.925286][ T1989]  el0_svc_common.constprop.0+0x44/0xf0
[ 9759.930746][ T1989]  do_el0_svc+0x38/0xb0
[ 9759.934799][ T1989]  el0_svc+0x2c/0xb8
[ 9759.938594][ T1989]  el0t_64_sync_handler+0xb8/0xc0
[ 9759.943521][ T1989]  el0t_64_sync+0x1a0/0x1a4
[ 9759.947929][ T1989] ---[ end trace 0000000000000000 ]---
[ 9759.975839][ T1989] ------------[ cut here ]------------
[ 9759.981188][ T1989] WARNING: CPU: 4 PID: 1989 at
net/mac80211/sta_info.c:417 sta_info_free+0xa0/0x110
....................
[ 9760.266646][ T1989] CPU: 4 PID: 1989 Comm: hostapd Tainted: G
 W   E      6.2.0-rc7-mainline-00015-gdc06692108da #1
[ 9760.277675][ T1989] Hardware name: Thundercomm Dragonboard 845c (DT)
[ 9760.284076][ T1989] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[ 9760.291782][ T1989] pc : sta_info_free+0xa0/0x110
[ 9760.296524][ T1989] lr : __sta_info_destroy_part2+0xf4/0x150
.................................
[ 9760.385123][ T1989] Call trace:
[ 9760.388286][ T1989]  sta_info_free+0xa0/0x110
[ 9760.392673][ T1989]  __sta_info_destroy_part2+0xf4/0x150
[ 9760.398026][ T1989]  __sta_info_destroy+0x2c/0x40
[ 9760.402763][ T1989]  sta_info_destroy_addr_bss+0x34/0x58
[ 9760.408115][ T1989]  ieee80211_del_station+0x1c/0x40
[ 9760.413115][ T1989]  nl80211_del_station+0xdc/0x250
[ 9760.418027][ T1989]  genl_family_rcv_msg_doit.isra.0+0xbc/0x128
[ 9760.423987][ T1989]  genl_rcv_msg+0x1f0/0x280
[ 9760.428374][ T1989]  netlink_rcv_skb+0x58/0x138
[ 9760.432943][ T1989]  genl_rcv+0x38/0x50
[ 9760.436805][ T1989]  netlink_unicast+0x1cc/0x298
[ 9760.441461][ T1989]  netlink_sendmsg+0x1d8/0x448
[ 9760.446117][ T1989]  sock_sendmsg+0x4c/0x58
[ 9760.450333][ T1989]  ____sys_sendmsg+0x314/0x3a8
[ 9760.454984][ T1989]  ___sys_sendmsg+0x80/0xc8
[ 9760.459371][ T1989]  __sys_sendmsg+0x68/0xc8
[ 9760.463672][ T1989]  __arm64_sys_sendmsg+0x24/0x30
[ 9760.468498][ T1989]  invoke_syscall+0x44/0x108
[ 9760.472982][ T1989]  el0_svc_common.constprop.0+0x44/0xf0
[ 9760.478422][ T1989]  do_el0_svc+0x38/0xb0
[ 9760.482467][ T1989]  el0_svc+0x2c/0xb8
[ 9760.486245][ T1989]  el0t_64_sync_handler+0xb8/0xc0
[ 9760.491164][ T1989]  el0t_64_sync+0x1a0/0x1a4
[ 9760.495551][ T1989] ---[ end trace 0000000000000000 ]---
[ 9760.500964][ T1989] ath10k_snoc 18800000.wifi: failed to clear all
peer wep keys for vdev 0: -2
[ 9760.509735][ T1989] ath10k_snoc 18800000.wifi: failed to
disassociate station: 8a:55:b5:61:9c:a7 vdev 0: -2
[ 9760.519547][ T1989] ------------[ cut here ]------------
[ 9760.519548][ T1989] sta_info_move_state() returned -2
[ 9760.519562][ T1989] WARNING: CPU: 4 PID: 1989 at
net/mac80211/sta_info.c:420 sta_info_free+0x108/0x110
..............................
[ 9760.889840][ T1989] CPU: 4 PID: 1989 Comm: hostapd Tainted: G
 W   E      6.2.0-rc7-mainline-00015-gdc06692108da #1
[ 9760.900872][ T1989] Hardware name: Thundercomm Dragonboard 845c (DT)
[ 9760.907270][ T1989] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[ 9760.914975][ T1989] pc : sta_info_free+0x108/0x110
[ 9760.919801][ T1989] lr : sta_info_free+0x108/0x110
...............................................
[ 9761.007538][ T1989] Call trace:
[ 9761.010703][ T1989]  sta_info_free+0x108/0x110
[ 9761.015185][ T1989]  __sta_info_destroy_part2+0xf4/0x150
[ 9761.020537][ T1989]  __sta_info_destroy+0x2c/0x40
[ 9761.025277][ T1989]  sta_info_destroy_addr_bss+0x34/0x58
[ 9761.030625][ T1989]  ieee80211_del_station+0x1c/0x40
[ 9761.035632][ T1989]  nl80211_del_station+0xdc/0x250
[ 9761.040544][ T1989]  genl_family_rcv_msg_doit.isra.0+0xbc/0x128
[ 9761.046507][ T1989]  genl_rcv_msg+0x1f0/0x280
[ 9761.050901][ T1989]  netlink_rcv_skb+0x58/0x138
[ 9761.055469][ T1989]  genl_rcv+0x38/0x50
[ 9761.059340][ T1989]  netlink_unicast+0x1cc/0x298
[ 9761.063995][ T1989]  netlink_sendmsg+0x1d8/0x448
[ 9761.068650][ T1989]  sock_sendmsg+0x4c/0x58
[ 9761.072866][ T1989]  ____sys_sendmsg+0x314/0x3a8
[ 9761.077520][ T1989]  ___sys_sendmsg+0x80/0xc8
[ 9761.081906][ T1989]  __sys_sendmsg+0x68/0xc8
[ 9761.086206][ T1989]  __arm64_sys_sendmsg+0x24/0x30
[ 9761.091028][ T1989]  invoke_syscall+0x44/0x108
[ 9761.095512][ T1989]  el0_svc_common.constprop.0+0x44/0xf0
[ 9761.100949][ T1989]  do_el0_svc+0x38/0xb0
[ 9761.104993][ T1989]  el0_svc+0x2c/0xb8
[ 9761.108768][ T1989]  el0t_64_sync_handler+0xb8/0xc0
[ 9761.113679][ T1989]  el0t_64_sync+0x1a0/0x1a4
[ 9761.118066][ T1989] ---[ end trace 0000000000000000 ]---
--------------------->8----------8<------------------

Full log here: https://www.irccloud.com/pastebin/P4cJCw0H/

Regards,
Amit Pundir

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
