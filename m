Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y62Jy-0000cG-0C
 for ath10k@lists.infradead.org; Tue, 30 Dec 2014 19:19:10 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 95CE540E9C5
 for <ath10k@lists.infradead.org>; Tue, 30 Dec 2014 11:18:48 -0800 (PST)
Message-ID: <54A2FA97.9090601@candelatech.com>
Date: Tue, 30 Dec 2014 11:18:47 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Reproducible issue in hacked 3.17 kernel, CT firmware
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

yeah, so maybe not reproducible upstream, but anyway...

My test case is to re-associate 4 stations over and over again, with
a scan and a 5 second sleep between iterations.  After
a short time, something goes weird and OS is mostly hung, probably
because important locks are held while ath10k is timing out communication
to firmware.

The last message I see from firmware is that it is deleting vdev 4.

I do not see any indication that firmware is crashed, but something
is wrong, maybe mgt buffers are used up?

I'm going to debug this further, but I am curious why the logs appear
to show that we continue sending cmds (cts_prot, for example) after the
vdev is configured down?


[  339.958906] sta104: deauthenticating from 04:f0:21:03:38:99 by local choice (Reason: 2=PREV_AUTH_NOT_VALID)
[  339.958918] ath10k_pci 0000:04:00.0: mac ampdu vdev_id 4 sta 04:f0:21:03:38:99 tid 0 action 1
[  339.958968] ath10k_pci 0000:04:00.0: wmi vdev install key idx 0 cipher 0 len 16
[  339.959076] ath10k_pci 0000:04:00.0: mac vdev 4 peer delete 04:f0:21:03:38:99 (sta gone)
[  339.959080] ath10k_pci 0000:04:00.0: wmi peer delete vdev_id 4 peer_addr 04:f0:21:03:38:99
[  339.959287] ath10k_pci 0000:04:00.0: mac vdev 4 stop (disassociated
[  339.959290] ath10k_pci 0000:04:00.0: wmi vdev stop id 0x4
[  339.959387] ath10k_pci 0000:04:00.0: WMI_VDEV_STOPPED_EVENTID
[  339.959405] ath10k_pci 0000:04:00.0: mac vdev 4 down
[  339.959407] ath10k_pci 0000:04:00.0: wmi mgmt vdev down id 0x4
[  339.959491] ath10k_pci 0000:04:00.0: mac vdev 4 cts_prot 0
[  339.959495] ath10k_pci 0000:04:00.0: wmi vdev id 0x4 set param 43 value 0
[  339.959499] ath10k_pci 0000:04:00.0: mac vdev 4 slot_time 1
[  339.959501] ath10k_pci 0000:04:00.0: wmi vdev id 0x4 set param 7 value 1
[  340.104623] ath10k_pci 0000:04:00.0: wmi event debug mesg len 144
[  340.104645] ATH10K_DBG_BUFFER:
[  340.104654] ath10k: [0000]: 00059396 100C2403 00000001 00000001 0043AF90 00000000 00059436 04104C1C
[  340.104662] ath10k: [0008]: 00000000 00059437 14105C0A 009B83F4 0043874C 009B83F4 009B81D4 009B83F4
[  340.104670] ath10k: [0016]: 00059437 0C104C30 711000BB 00422368 0043874C 00059437 0C104C30 711000BB
[  340.104684] ath10k: [0024]: 004223A0 0043874C 00059437 0C104C30 711000BB 004223D8 0043874C 00059437
[  340.104687] ath10k: [0032]: 08104C08 00000001 00000008
[  340.104688] ATH10K_END
[  342.962494] ath10k_pci 0000:04:00.0: failed to set erp slot for vdev 4: -11
[  342.962509] ath10k_pci 0000:04:00.0: mac vdev 4 preamble 1n
[  342.962512] ath10k_pci 0000:04:00.0: wmi vdev id 0x4 set param 8 value 1
[  345.965900] ath10k_pci 0000:04:00.0: failed to set preamble for vdev 4: -11
[  345.965916] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  348.969287] ath10k_pci 0000:04:00.0: failed to set wmm params: -11
[  348.969307] ath10k_pci 0000:04:00.0: wmi pdev set wmm params
[  351.972696] ath10k_pci 0000:04:00.0: failed to set wmm params: -11
[  351.972713] ath10k_pci 0000:04:00.0: wmi pdev set wmm params

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
