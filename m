Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTtLZ-0002fU-1T
 for ath10k@lists.infradead.org; Wed, 29 Apr 2020 20:30:22 +0000
Received: by mail-il1-x144.google.com with SMTP id b18so3810389ilf.2
 for <ath10k@lists.infradead.org>; Wed, 29 Apr 2020 13:30:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87blnbizws.fsf@tynnyri.adurom.net>
References: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
 <87blnbizws.fsf@tynnyri.adurom.net>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 29 Apr 2020 22:30:18 +0200
Message-ID: <CAKR_QV+yETmzf5Fgfbx_g8RxdfDbT0Uikvt8mUtstT0N0-p7hQ@mail.gmail.com>
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
To: Kalle Valo <kvalo@adurom.com>
Cc: ath10k@lists.infradead.org, Arvind Bakshi <arvindbakshicool@gmail.com>

On 28/04/2020, Kalle Valo <kvalo@adurom.com> wrote:
> Arvind Bakshi <arvindbakshicool@gmail.com> writes:
>
>> Getting 1 mbps link speed and average signal strength, even on
>> standing next to router on every linux distro whereas windows 10 gives
>> 150 mbps link speeds and excellent signal strength even standing quite
>> far off from router. Tested on Fedora 30/31 and ubuntu 18.04/20.04.
>> Turning off wireless power management : sudo iwconfig wlan0 power off
>> doesn't make a difference.
>> Turning off all power saving options using TLP also doesn't make a
>> difference.
>> Software (OS, Firmware version, kernel, driver, etc)
>> Tested on Fedora 30/31 and ubuntu 18.04 LTS
>> Wifi card: Qualcomm QCA 9377
>> Device: Dell Vostro 3468 (shipped with ubuntu 16.04)
>>
>> Hardware (NIC chipset, platform, etc)
>> Qualcomm QCA 9377
>
> My first guess is a problem with calibration data, for example using
> wrong board data file (which are device specific). Unfortunately I don't
> know what would be the correct board data file for your device, ath10k
> is supposed to choose it automatically but we don't always have all
> board data files available.
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

There's nothing wrong with calibration data. Board and firmware
checksums are the same as on my system. Probably kernel problem
again..

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
