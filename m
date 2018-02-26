Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqGE9-0001oh-6e
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 10:41:58 +0000
MIME-Version: 1.0
Date: Mon, 26 Feb 2018 16:11:38 +0530
From: periyasa@codeaurora.org
Subject: Re: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS
 changed"
In-Reply-To: <CAJ-Vmo=xxG_Jp=uC-Cx96R0YzO8O0tOVe2G6Nyx8ceWopiwvXQ@mail.gmail.com>
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
 <CAJ-Vmo=xxG_Jp=uC-Cx96R0YzO8O0tOVe2G6Nyx8ceWopiwvXQ@mail.gmail.com>
Message-ID: <559965cc9735f6616957f9ee84a17e52@codeaurora.org>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: adrian.chadd@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-02-26 14:15, Adrian Chadd wrote:
> hi!
> 
> On 25 February 2018 at 22:16, Karthikeyan Periyasamy
> <periyasa@codeaurora.org> wrote:
>> This reverts commit 55884c045d31a29cf69db8332d1064a1b61dd159.
>> 
>> When Ath10k is in AP mode and an unassociated STA sends a VHT action 
>> frame
>> (Operating Mode Notification for the NSS change) periodically to AP 
>> this causes
>> ath10k to call ath10k_station_assoc() which sends WMI_PEER_ASSOC_CMDID 
>> during
>> NSS update. Over the time (with a certain client it can happen within 
>> 15 mins
>> when there are over 500 of these VHT action frames) continuous calls 
>> of
>> WMI_PEER_ASSOC_CMDID cause firmware to assert due to resource exhaust.
>> 
>> To my knowledge setting WMI_PEER_NSS peer param itself enough to 
>> handle NSS
>> updates and no need to call ath10k_station_assoc(). So revert the 
>> original
>> commit from 2014 as it's unclear why the change was really needed.
>> Now the firmware assert doesn't happen anymore.
>> 
>> Issue observed in QCA9984 platform with firmware 
>> version:10.4-3.5.3-00053.
>> This Change tested in QCA9984 with firmware version: 10.4-3.5.3-00053 
>> and
>> QCA988x platform with firmware version: 10.2.4-1.0-00036.
> 
> Did you test this on any of the other major firmware variants? I
> wonder if it snuck in because of some firmware quirk in something way
> before dakota/cascade and 10.4 were a thing.
> 
> Eg, Peregrine? Rome? Maybe even earlier Beeliner, just to double check?
> 
Yes. I tested this on peregrine, Beeliner, Dakota and Cascade. This code 
was introduced before Rome.

Thanks,
Karthikeyan.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
