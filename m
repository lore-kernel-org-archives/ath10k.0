Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1psx-000423-0c
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 05:46:11 +0000
Received: by wgez8 with SMTP id z8so93832617wge.0
 for <ath10k@lists.infradead.org>; Sun, 07 Jun 2015 22:45:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <557460CE.5060400@lanada.kaist.ac.kr>
References: <557460CE.5060400@lanada.kaist.ac.kr>
Date: Mon, 8 Jun 2015 07:45:48 +0200
Message-ID: <CALhHN=qMbakDmAyWPPPgzEuDpkseW6P2s+EVt4ep78d+UMPObg@mail.gmail.com>
Subject: Re: Configuring ath10k device driver supporting 802.11ac and IBSS
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Sangwoo Moon <swmoon@lanada.kaist.ac.kr>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 June 2015 at 17:18, Sangwoo Moon <swmoon@lanada.kaist.ac.kr> wrote:
> Hello,
>
> I am currently trying to configure ath10k device
> to support 802.11ac VHT functionality in IBSS mode.
>
> I am using Qualcomm Atheros QCA988x 802.11ac network adapter
> in Gigabyte M1405 laptop.
> I am using Ubuntu 14.04.2 (kernel version 3.16.0-30-generic) as
> main operating system, and using backports-3.16-rc1-1 as
> ath10k device driver.
>
> As far as I know, I can use iw to configure a WLAN interface
> into IBSS mode (ad-hoc mode),
> and hostapd to configure the interface enabling 802.11ac VHT
> functionalities.
>
> However, what I want to do is enabling 802.11ac VHT features, in
> IBSS mode.
>
> After series of searching, I could not find any solutions to
> neither turn on VHT mode in iw nor using IBSS mode in hostapd.
> I used the latest version of iw (4.1) and hostapd (2.4) trying to solve this
> issue.
> I also installed the latest wireless-regdb-2015.06.05 to mitigate
> the regulatory issue in frequency band selection.
>
> Is there anyone who can help with this issue?
> Thanks in advance.
Apply [PATCH] ath10k: enable VHT for IBSS.
Next configure ibss from wpa_supplicant.
Check iw wlanX info if bw=80MHz used.

I think iw don't support VHT yet, so wpa_supplicant is best choice here.

BR
Janusz

> Best regards,
> --Sangwoo Moon
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
