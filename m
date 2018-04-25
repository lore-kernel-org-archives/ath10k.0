Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBMGl-00080J-Mb
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 15:23:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: 9984 with 10.4.3.5.3-0057 crashes
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
 <c48c1bae-04c9-55d0-fdb9-d9ae8f7cb843@dd-wrt.com>
 <5AD9A1DF.6060007@broadcom.com>
 <87wowxdirv.fsf@kamboji.qca.qualcomm.com>
 <dafff879-3630-9596-bcb6-eaf07289318d@dd-wrt.com>
 <87k1sxcgyh.fsf@kamboji.qca.qualcomm.com>
 <a58d42c2-84ca-1c17-8591-b20bfd91660c@dd-wrt.com>
Date: Wed, 25 Apr 2018 18:23:28 +0300
In-Reply-To: <a58d42c2-84ca-1c17-8591-b20bfd91660c@dd-wrt.com> (Sebastian
 Gottschall's message of "Tue, 24 Apr 2018 08:08:07 +0200")
Message-ID: <87a7tr8g3z.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 24.04.2018 um 07:27 schrieb Kalle Valo:
>> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>>
>>> just for your notice. 10.4.3.5.3-0057 on 9984 which was just released
>>> crashes in vht160 operation mode immediatly after first station
>>> associates
>>> last known working stable fw so far is 10.4-3.4-00104. the whole
>>> 10.4.3.5.3 series seem to be seriously broken or the api has been
>>> changed in a way
>>> which is unsupported by ath10k (which i think is the cause of the
>>> problem)
>>> it would be good to know what has been changed.
>>
>> At least I was not informed any changes in the firmware interface. What
>> version of ath10k are you using? Do you have any custom patches on
>> ath10k?
>
> i'm using latest git version for testing here but there is one
> relevant patch required for more recent firmwares like 3.4 series (see
> below) i posted already a long time ago, that vht160 will not work
> anymore without that patch in newer firmwares since qca changed the api
> for channel mapping in vht160.

I don't remember what happened to that patch, but please resubmit it
with a proper commit log and S-o-b line.

I was told that the firmware crash is an assert triggered by host not
populating the parameter 'peer_bw_rxnss_override' in
WMI_PEER_ASSOC_CMDID which is needed for 160/80+80 operation.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
