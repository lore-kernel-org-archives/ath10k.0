Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i874O-00083O-B3
 for ath10k@lists.infradead.org; Wed, 11 Sep 2019 18:10:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: WARNING at net/mac80211/sta_info.c:1057
 (__sta_info_destroy_part2())
References: <CAHk-=wgBuu8PiYpD7uWgxTSY8aUOJj6NJ=ivNQPYjAKO=cRinA@mail.gmail.com>
Date: Wed, 11 Sep 2019 21:10:12 +0300
In-Reply-To: <CAHk-=wgBuu8PiYpD7uWgxTSY8aUOJj6NJ=ivNQPYjAKO=cRinA@mail.gmail.com>
 (Linus Torvalds's message of "Wed, 11 Sep 2019 11:05:46 +0100")
Message-ID: <87lfuuln5n.fsf@tynnyri.adurom.net>
MIME-Version: 1.0
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>

+ ath10k list

Linus Torvalds <torvalds@linux-foundation.org> writes:

> So I'm at LCA, reading email, using my laptop more than I normally do,
> and with different networking than I normally do.
>
> And I just had a 802.11 WARN_ON() trigger, followed by essentially a
> dead machine due to some lock held (maybe rtnl_lock).
>
> It's possible that the lock held thing happened before, and is the
> _reason_ for the delay, I don't know. I had to reboot the machine, but
> I gathered as much information as made sense and was obvious before I
> did so. That's appended.

Some notes while investigating this:

> But wait!
>
> ... then 10+ minutes later:
>
>    ath10k_pci 0000:02:00.0: wmi command 16387 timeout, restarting hardware
>    ath10k_pci 0000:02:00.0: failed to set 5g txpower 23: -11
>    ath10k_pci 0000:02:00.0: failed to setup tx power 23: -11
>    ath10k_pci 0000:02:00.0: failed to recalc tx power: -11
>    ath10k_pci 0000:02:00.0: failed to set inactivity time for vdev 0: -108
>    ath10k_pci 0000:02:00.0: failed to setup powersave: -108
>
> That certainly looks like something did try to set a power limit, but
> eventually failed.

I suspect the failing WMI command is called from:

ath10k_bss_info_changed()
ath10k_mac_txpower_recalc()
ath10k_mac_txpower_setup()
ath10k_wmi_pdev_set_param()
ath10k_wmi_cmd_send()
ath10k_wmi_cmd_send_nowait()
ath10k_htc_send()

-11 is -EAGAIN which would mean that the HTC credits have run out some
 reason for the WMI command:

if (ep->tx_credits < credits) {
        ath10k_dbg(ar, ATH10K_DBG_HTC,
                "htc insufficient credits ep %d required %d available %d\n",
                eid, credits, ep->tx_credits);
        spin_unlock_bh(&htc->tx_lock);
        ret = -EAGAIN;
        goto err_pull;
}

Credits can run out, for example, if there's a lot of WMI command/event
activity and are not returned during the 3s wait, firmware crashed or
problems with the PCI bus. But when the WMI command timeout happens
ath10k is supposed to restart the firmware and everything should be
usable again.
                                             
> Immediately after that:
>
>    wlp2s0: deauthenticating from 54:ec:2f:05:70:2c by local choice
> (Reason: 3=DEAUTH_LEAVING)
>    ath10k_pci 0000:02:00.0: failed to read hi_board_data address: -16
>    ath10k_pci 0000:02:00.0: failed to receive initialized event from
> target: 00000000
>    ath10k_pci 0000:02:00.0: failed to receive initialized event from
> target: 00000000
>    ath10k_pci 0000:02:00.0: failed to wait for target init: -110

I suspect here ath10k tries to reset the target during stop operation,
"failed to receive initialized event from target" comes from:

ath10k_pci_hif_stop()
ath10k_pci_safe_chip_reset()
ath10k_pci_warm_reset()
ath10k_pci_wait_for_target_init()

It shouldn't fail like that, which makes me suspect either a low level
problem or a bug in qca6174 firmware restart code. To check the latter,
could you please try to force a firmware crash and see if firmware
restart is working for you?

To crash the firmware you need to write either "hard" or "assert" (I
forgot which one QCA6174 firmware supports) to
/sys/kernel/debug/ieee80211/phy*/ath10k/simulate_fw_crash. And what
should happen is that the firmware crashes, ath10k prints a big pile of
warnings, restarts it and in few seconds everything resumes to normal
without user space even noticing it.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
