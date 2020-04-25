Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSK3r-00068o-DH
 for ath10k@lists.infradead.org; Sat, 25 Apr 2020 12:37:38 +0000
Received: by mail-il1-x141.google.com with SMTP id u5so11966345ilb.5
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2020 05:37:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
References: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Sat, 25 Apr 2020 14:37:32 +0200
Message-ID: <CAKR_QVJvko9VidtC-uR2XdwmYV_e3sm4rN-0162gpnkj7hFgZA@mail.gmail.com>
Subject: Re: Poor link speeds and signal strength on Qualcomm QCA 9377
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
To: Arvind Bakshi <arvindbakshicool@gmail.com>
Cc: ath10k@lists.infradead.org

On 25/04/2020, Arvind Bakshi <arvindbakshicool@gmail.com> wrote:
> Sir/Mam
>
> Getting 1 mbps link speed and average signal strength, even on
> standing next to router on every linux distro whereas windows 10 gives
> 150 mbps link speeds and excellent signal strength even standing quite
> far off from router. Tested on Fedora 30/31 and ubuntu 18.04/20.04.
> Turning off wireless power management : sudo iwconfig wlan0 power off
> doesn't make a difference.
> Turning off all power saving options using TLP also doesn't make a
> difference.
> Software (OS, Firmware version, kernel, driver, etc)
> Tested on Fedora 30/31 and ubuntu 18.04 LTS
> Wifi card: Qualcomm QCA 9377
> Device: Dell Vostro 3468 (shipped with ubuntu 16.04)
>
> Hardware (NIC chipset, platform, etc)
> Qualcomm QCA 9377
>
>
>
> Please provide driver fix for this wireless card.
>
> Thanks & Regards
>
> Arvind Bakshi
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

Hi

Show output of "dmesg | grep ath10k" and "uname -a" on ubuntu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
