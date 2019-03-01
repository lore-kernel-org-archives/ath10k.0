Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzetO-0008DG-2c
 for ath10k@lists.infradead.org; Fri, 01 Mar 2019 09:55:47 +0000
Received: by mail-ot1-x342.google.com with SMTP id g1so20404793otj.11
 for <ath10k@lists.infradead.org>; Fri, 01 Mar 2019 01:55:45 -0800 (PST)
MIME-Version: 1.0
References: <CAMrEMU8siEmdzETiA5gvQ6+OAKiQCqUBgnVcO67rwu-x-BxUKA@mail.gmail.com>
 <CAMrEMU-++j02+sMwMKFS5SSsEzXbu7Sb7WceheKvVPoMUmyi1Q@mail.gmail.com>
 <87k1hmlpq8.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87k1hmlpq8.fsf@kamboji.qca.qualcomm.com>
From: Justin Capella <justincapella@gmail.com>
Date: Fri, 1 Mar 2019 01:55:32 -0800
Message-ID: <CAMrEMU_2ZxWg5NJc+-X4OhBFiuE+=m8B_ztS-Af4peu57_h=sg@mail.gmail.com>
Subject: Re: ACS scans not returning noise floor
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
Cc: ath10k@lists.infradead.org

[    5.979641] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    6.263245] ath10k_pci 0000:01:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[    6.263252] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[    6.263598] ath10k_pci 0000:01:00.0: firmware ver 10.2.4-1.0-00041
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 f43fa422
[    6.301982] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[    7.566975] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[    7.588108] ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
cal otp max-sta 128 raw 0 hwcrypto 1
[    7.712550] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

linux-firmware-20181218.0f22c85 was working, will say that I have been
through several kernels recently, and the newet firmware from github
with the qca-ath kernel works

On Tue, Feb 26, 2019 at 4:05 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Justin Capella <justincapella@gmail.com> writes:
>
> > My apologies,
> > I left out the important bit of the debug logs
> > [ 1265.917324] ath10k_warn: 61 callbacks suppressed
> > [ 1265.917330] ath10k_pci 0000:01:00.0: failed to parse chan info event: -71
> >
> > Possibly also relevant, i'm using country "US" I am aware that the fcc
> > crda/regdom wasn't supported, but without the 802.11h option
> > condigured in hostapd it had been working with older firmware.
> >
> > 7ce94a62264be94dc1c41ff5d0c8a19c7f0d3143 is the head of the master
> > branch I'm using
>
> What hardware and firmware version? That's very important. Preferably
> copy the ath10k driver initialisation messages which contain all that.
>
> Is this is regression, for example did an old firmware work? If yes,
> which one did not have this problem?
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
