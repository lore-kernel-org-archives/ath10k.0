Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3.dhosting.pl ([195.88.50.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vr4f3-00011P-29
 for ath10k@lists.infradead.org; Thu, 12 Dec 2013 11:42:34 +0000
Message-ID: <52A9A10D.9000901@elnovel.com>
Date: Thu, 12 Dec 2013 12:42:05 +0100
From: Tomasz Tajmajer <tt@elnovel.com>
MIME-Version: 1.0
Subject: Re: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
References: <52A1FC69.7080901@elnovel.com>	<CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>	<874n6i1jk7.fsf@kamboji.qca.qualcomm.com>	<52A5955E.2060106@elnovel.com>	<CA+BoTQk95VmU=e1cLOtzcX8Y_j6YjFFw1STOT=r7NSHTd2vuJA@mail.gmail.com>	<52A5A98A.3000102@elnovel.com>	<52A5B33D.7010006@elnovel.com>	<52A85844.3080009@elnovel.com>	<CALhHN=oBnJG61UPQ9PYHAJd9cRAOBabYwVs=nKUTRCLaEy9YfA@mail.gmail.com>
 <CALhHN=qT=5H9qc8oqB_sZARzJvCoQ7wTwY09nB9HsyJTXx0ZEg@mail.gmail.com>
In-Reply-To: <CALhHN=qT=5H9qc8oqB_sZARzJvCoQ7wTwY09nB9HsyJTXx0ZEg@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org


On 11.12.2013 20:51, Janusz Dziedzic wrote:
>> Seems from driver we configure everything correctly. Rate Control is
>> in FW - so FW will decide what NSS/MCS to use. Here we see our devices
>> works fine with 3x3.
>>
>> BTW.
>> You can try to use fixed_rate setting. You will have to apply some
>> patches from mac80211-next/group:
>>
>> Kernel:
>> 1) nl80211: don't clear bitrate_mask twice
>> 2) nl80211: back to default bitrate_mask correctly
>> 3) nl80211/cfg80211: bitrate_mask, rename mcs to ht_mcs
>> 4) nl80211: add VHT support for set_bitrate_mask
>> 5) ath10k: add set_bitrate_mask callback - this I will send in few minutes
>>
>> iw:
>> 1) iw: add VHT MCS/NSS set support to set bitrates
>>
>> After that just run ap and: iw wlanX set bitrates legacy-5 ht-mcs-5
>> vht-mcs-5 3:0
>>
>> You should send frames from AP with NSS=3, MCS=0
>>
> BTW Do you have same problem with HT, or only with VHT?
>
> BR
> Janusz
>

For HT 3x3 MIMO is working fine. The issue occurs only for VHT.

Thank you for your suggestions, I'll apply the patches and try to force 
3 spatial streams manually. Hope it will work.

BTW: Which firmware and driver versions you were using in your tests ?

BR
TomaszT




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
