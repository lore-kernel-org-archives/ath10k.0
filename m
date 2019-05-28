Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVglO-0007BE-Pm
 for ath10k@lists.infradead.org; Tue, 28 May 2019 18:24:13 +0000
Received: by mail-vs1-xe43.google.com with SMTP id x8so841652vsx.13
 for <ath10k@lists.infradead.org>; Tue, 28 May 2019 11:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_j7i3ZAcfaQ-on5mXTKxd--erzCChKhEEU_6Yk+j2w57PeVg@mail.gmail.com>
 <8736ky6cyp.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8736ky6cyp.fsf@kamboji.qca.qualcomm.com>
From: Vjaceslavs Klimovs <vklimovs@gmail.com>
Date: Tue, 28 May 2019 11:23:03 -0700
Message-ID: <CAC_j7i0eQfHu=9r8biPkpGhxrSqbYQdf2cxT0tDfnH7YgGxO6w@mail.gmail.com>
Subject: Re: ath10k panic with 5.1 kernel and qca9984 on association
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Abhishek Ambure <aambure@codeaurora.org>, ath10k@lists.infradead.org

Abhishek,
I am happy to test a proposed fix, let me know.

On Tue, May 28, 2019 at 4:22 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> + Abhishek
>
> Vjaceslavs Klimovs <vklimovs@gmail.com> writes:
>
> > With 5.1 and head kernel, machine running as AP with qca9984 locks up
> > without being able to complete stack trace to console after a client
> > tries to associate with it. Following are (OCR transcribed) error
> > messages:
> >
> > [ 177.161539] BUG: unable to handle kernel paging request at fffffffffffff7bo
> > [ 177.161553] #PF error: (normal kernel read fault)
> > [ 177.161561] PGD 703812067 P4D 703812067 PUD 20381406 PMD 0
> > [ 177.161571] Oops: 0000 (#1) SMP PTI
> > [ 177.161577] CPU: 6 PID: 0 Comm: swapper/6 Tainted: G OE 5.1.3-gentoo #1
> >
> > [Garbage on screen after that point]
> >
> > and
> >
> > [67.805490] RBP: ffff9c4c57983d 18 R08: 0000000000000000 R09:
> > 0000000000000000 [67.805501] R10: 0000000000000002 R11:
> > 0000000000000000 R12: 0000000000000001 [67.805512] R13:
> > 0000000000000000 R14: 0000000000060002 R15: 0000000000000000
> > [67.805523] FS: 000000000000000000000) GS:ffff9c4c57980000 (0000)
> > knIGS:000000000 [67.805535] CS: 0010 DS: 0000 ES: 0000 CRO:
> > 0000000080050033
> > [67.805544] CR2: fffffffffffff7b0 CR3: 00000005f7e0e006 CR4: 00000000003606e0
> > [67.805555] DRO: 0000000000000000 DR1: 0000000000000000 DR2:
> > 0000000000000000 [67.805566] DR3: 0000000000000000 DR6:
> > 00000000fffeoffO DR7: 0000000000000400 [67.805577] Call Trace:
> > [67.805582] <IRQ>
> > [67.805592] ath10k_htt_t2h_msg_handler+0xbda/0xf80 [ath10k_core]
> > [67.805603] ? _raw_spin_unlock_bh+0xie/0x20
> > [67.805614] ? ath1ok_ce_per_engine_service+0xf1/0x100 [ath10k_corel
> > [67.805626] ath10k_pci_htt_rx_cb+0x172/0x260 [ath10k_pci]
> > [67.8056391] ath10k_ce_per_engine_service+0x9e/0x100 [ath10k_core)
> >
> > [Garbage on screen after that point]
> >
> > The issue does not reproduce on 5.0.17 but is reliably reproducible in
> > 5.1+ by just trying to associate to that AP. So I thought I'd run git
> > bisect. After bisecting,
> >
> > 6ddc3860a5668808bacbfcb1f1bf50d5d7ad1956, ath10k: add support for ack
> > rssi value of data tx packets
> >
> > is the first commit that triggers the problem. Reverting that commit
> > from head or from 5.1.5 reliably makes everything work as expected.
>
> Thank you for the bisect, this is really helpful. Full commit log below.
> Abhishek, please fix this or send a revert for 5.2.
>
> commit 6ddc3860a5668808bacbfcb1f1bf50d5d7ad1956
> Author:     Abhishek Ambure <aambure@codeaurora.org>
> AuthorDate: Mon Feb 25 11:45:48 2019 +0200
> Commit:     Kalle Valo <kvalo@codeaurora.org>
> CommitDate: Tue Feb 26 14:58:06 2019 +0200
>
>     ath10k: add support for ack rssi value of data tx packets
>
>     In WCN3990, WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI service Indicates that
>     the firmware has the capability to send the RSSI value of the ACK for all
>     data and management packets transmitted.
>
>     If WMI_RSRC_CFG_FLAG_TX_ACK_RSSI is set in host capability then firmware
>     sends RSSI value in "data" tx completion event. Host extracts ack rssi
>     values of data packets from their tx completion event.
>
>     Tested HW: WCN3990
>     Tested FW: WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
>
>     Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
>     Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
