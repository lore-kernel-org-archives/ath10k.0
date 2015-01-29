Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGqaL-0004fU-NX
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 15:00:46 +0000
Message-ID: <54CA4B06.10807@candelatech.com>
Date: Thu, 29 Jan 2015 07:00:22 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:Prevent setting wrong key idx for station
References: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>	<54C7C3B7.4020706@candelatech.com>
 <87fvat3ml0.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvat3ml0.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: senthilb@qti.qualcomm.com, SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>, ath10k@lists.infradead.org

I didn't realize it was only about WEP...probably not worth bothering
stable for just that.

Thanks,
Ben

On 01/29/2015 02:31 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 01/27/2015 06:30 AM, senthilb@qti.qualcomm.com wrote:
>>> From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
>>>
>>> Ath10k driver sets wrong default key idx that results in
>>> sending unicast frames with multicast key.
>>
>> Is this something that should be back-ported to stable releases?
>
> Sure, if somebody cares about WEP that much :)
>
> Should I add CC stable to the patch?
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
