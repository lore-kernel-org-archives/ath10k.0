Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwzAN-0008Fv-3K
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 00:58:16 +0000
Received: by mail-oi1-x22f.google.com with SMTP id s16so444642oih.9
 for <ath10k@lists.infradead.org>; Thu, 21 Feb 2019 16:58:14 -0800 (PST)
MIME-Version: 1.0
References: <CAMrEMU8siEmdzETiA5gvQ6+OAKiQCqUBgnVcO67rwu-x-BxUKA@mail.gmail.com>
In-Reply-To: <CAMrEMU8siEmdzETiA5gvQ6+OAKiQCqUBgnVcO67rwu-x-BxUKA@mail.gmail.com>
From: Justin Capella <justincapella@gmail.com>
Date: Thu, 21 Feb 2019 16:58:02 -0800
Message-ID: <CAMrEMU-++j02+sMwMKFS5SSsEzXbu7Sb7WceheKvVPoMUmyi1Q@mail.gmail.com>
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
To: ath10k@lists.infradead.org

My apologies,
I left out the important bit of the debug logs
[ 1265.917324] ath10k_warn: 61 callbacks suppressed
[ 1265.917330] ath10k_pci 0000:01:00.0: failed to parse chan info event: -71

Possibly also relevant, i'm using country "US" I am aware that the fcc
crda/regdom wasn't supported, but without the 802.11h option
condigured in hostapd it had been working with older firmware.

7ce94a62264be94dc1c41ff5d0c8a19c7f0d3143 is the head of the master
branch I'm using

On Thu, Feb 21, 2019 at 4:39 PM Justin Capella <justincapella@gmail.com> wrote:
>
> I'm using the firmware from ~2 days ago, and ath10k_wmi_pull_ch_info
> seems to be returning -EPROTO. I have no idea what I'm doing, but I
> notice there is a default noise floor in one of the headers, perhaps
> this could be used somewhere? I'm encountering this becuase hostapd is
> complaining that the ACS survey does not contain enough info.
>
> [ 1261.111452] ath10k_pci 0000:01:00.0: pci rx ce pipe 5 len 28
> [ 1261.111457] ath10k_pci 0000:01:00.0: pci rx: 00000000: 01 00 14 00
> 00 05 00 00 0f 00 00 00 50 14 00 00  ............P...
> [ 1261.111460] ath10k_pci 0000:01:00.0: pci rx: 00000010: 50 14 00 00
> 00 00 00 00 00 00 00 00              P...........
> [ 1261.111464] ath10k_pci 0000:01:00.0: htt rx, msg_type: 0xF
> [ 1261.111469] ath10k_pci 0000:01:00.0: htt chan change freq 5200 phymode 11a
> [ 1261.115411] ath10k_pci 0000:01:00.0: pci rx ce pipe 2 len 36
> [ 1261.115419] ath10k_pci 0000:01:00.0: pci rx: 00000000: 02 00 1c 00
> 00 06 00 00 00 90 00 00 08 00 00 00  ................
> [ 1261.115424] ath10k_pci 0000:01:00.0: pci rx: 00000010: 03 00 00 00
> 50 14 00 00 01 a0 00 00 00 a0 00 00  ....P...........
> [ 1261.115427] ath10k_pci 0000:01:00.0: pci rx: 00000020: 00 00 00 00
>                                     ....
> [ 1261.115432] ath10k_pci 0000:01:00.0: htc rx completion ep 2 skb
> 0000000063dc45b6
> [ 1261.115439] ath10k_pci 0000:01:00.0: scan event foreign channel
> type 8 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
> running (2)
> [ 1261.115448] ath10k_pci 0000:01:00.0: pci rx ce pipe 2 len 40
> [ 1261.115452] ath10k_pci 0000:01:00.0: pci rx: 00000000: 02 00 20 00
> 00 07 00 00 0c 90 00 00 00 00 00 00  .. .............
> [ 1261.115456] ath10k_pci 0000:01:00.0: pci rx: 00000010: 50 14 00 00
> 00 00 00 00 00 00 00 00 a3 43 33 00  P............C3.
> [ 1261.115459] ath10k_pci 0000:01:00.0: pci rx: 00000020: c8 67 4a 01
> e8 90 16 00                          .gJ.....
> [ 1261.115463] ath10k_pci 0000:01:00.0: htc rx completion ep 2 skb
> 00000000b2b31359

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
