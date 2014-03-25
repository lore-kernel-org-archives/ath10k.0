Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSTdk-0000He-CI
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 15:51:48 +0000
Message-ID: <5331A5FE.6000801@candelatech.com>
Date: Tue, 25 Mar 2014 08:51:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: How to get tx rate in ath10k?
References: <5330C701.607@candelatech.com>
 <87ha6m3ejc.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ha6m3ejc.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/25/2014 12:47 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> With Janusz's changes, rx rate and rx-signal appear to be reported
>> correctly.
>>
>> But, tx-rate is not reported.
>>
>> Anyone have any suggestions for what needs doing to get
>> tx rate properly reported?
> 
> Firmware does not provide this information to the host currently, so
> this will need firmware changes.


Ok, that was what I suspected.  I'll work on adding it to my
firmware...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
