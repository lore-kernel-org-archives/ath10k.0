Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVcmQ-0003RF-PA
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 09:18:19 +0000
Received: by igqa13 with SMTP id a13so37942043igq.0
 for <ath10k@lists.infradead.org>; Wed, 11 Mar 2015 02:17:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54FF157C.7090208@candelatech.com>
References: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
 <54FF157C.7090208@candelatech.com>
Date: Wed, 11 Mar 2015 10:17:56 +0100
Message-ID: <CACKGw+FhOsfLX1ZLw0Y17xrrVPEXgQkaUQzjJqA-CHwpD72v-Q@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix PMG by using AES-CMAC/IGTK software crypto
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 10 March 2015 at 17:02, Ben Greear <greearb@candelatech.com> wrote:
> On 03/10/2015 06:32 AM, Bartosz Markowski wrote:
>> While testing with older supplicant, .drv_set_key() was failing due to
>> higher than ath10k firmware could handle key_index (WMI_MAX_KEY_INDEX == 3).
>>
>> --
>> wpa_driver_nl80211_set_key: ifindex=15 alg=4 addr=0x7f02b129fbe3 key_idx=4 set_tx=0 seq_len=6 key_len=16
>>     broadcast key
>> nl80211: set_key failed; err=-22 Invalid argument)
>> wlan0: WPA: Failed to configure IGTK to the driver
>> wlan0: RSN: Failed to configure IGTK
>> --
>>
>> In order to fix this case (PMF: AES-CMAC/IGTK) force the AES_CMAC cipher to
>> be handled by software.
>
> How did you get firmware to allow the host to do the encryption?
:
> Every time I've tried such a thing I end up with either nothing or garbage on
> the air.
>
> Or this this particular type of encryption treated differently by the
> firmware?

I would suspect so, but it's just my gut feeling. I did not check this
on a firmware level, as the PMF (AES_CMAC) encryption was done this
way from the very beggining in ath10k.
This patch only address the key_idx exceeded case, where
ath10k_set_key() was returning -ENOSPC, so we could inform mac80211
explicitly (by returning '1') it shall do the encryption in software.

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
