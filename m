Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wq1XQ-00080s-26
 for ath10k@lists.infradead.org; Thu, 29 May 2014 14:42:36 +0000
Received: by mail-we0-f171.google.com with SMTP id w62so522667wes.30
 for <ath10k@lists.infradead.org>; Thu, 29 May 2014 07:42:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACKGw+FT0GTRF+tn_Odi0KQvEFL93Oyjj4x=SKgNP1aayB4-QA@mail.gmail.com>
References: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
 <53873A58.1070209@candelatech.com>
 <CACKGw+FT0GTRF+tn_Odi0KQvEFL93Oyjj4x=SKgNP1aayB4-QA@mail.gmail.com>
Date: Thu, 29 May 2014 16:42:13 +0200
Message-ID: <CACKGw+HZEvVVaGk3DzbvCTe7GSvU206=hr4QswLXVyiat1ozZg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix vdev map size for 10.x firmware
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

On 29 May 2014 16:10, Bartosz Markowski <bartosz.markowski@tieto.com> wrote:
> On 29 May 2014 15:47, Ben Greear <greearb@candelatech.com> wrote:
>>
>>
>> On 05/29/2014 06:36 AM, Bartosz Markowski wrote:
>>>
>>> Firmware 10.x supports up to 8 virtual AP interfaces
>>> (comparing to 7 for main firmware). Previous vdev map
>>> initialization was missing enough space for 8 + 1 vdevs
>>> (we may spent one for mac monitor), due to wrong define used.
>>>
>>> Use correct one - TARGET_10X_NUM_VDEVS - for 10.x firmware.
>>
>>
>> You are bumping total vdevs up to 16 with that patch...have you
>> actually tested that many?  The stock firmware has quite a bit of
>> deficiencies in the concurrency handling, at least for stations.
>
> No, I have never tested it with so many. I'm running tests with 8 at
> most. And by this patch I just aimed to support 8 VAPS we advertise in
> iface_combinations to mac80211 (.max_interfaces = 8). I was managed to
> get only 7 before, since 1 vdev was being allocated as monitor.

FYI: I quickly tried to extend the .max_interfaces +
interface_combinations limit in ath10k and check with 15 VAPs (using
hostapd, open network; on MIPS platform) and it just worked.. I did
not perform any exploratory testing, but managed to connect a couple
of clients to various bssids + run some sane iperf traffic etc.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
