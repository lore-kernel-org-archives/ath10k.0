Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eLFXY-000759-EJ
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 21:41:42 +0000
Subject: Re: [v3] ath10k: rebuild crypto header in rx data frames
References: <1509035774-26553-1-git-send-email-kvalo@qca.qualcomm.com>
 <59b2ec22dc9c4db0bd30a65dba660b1c@euamsexm01a.eu.qualcomm.com>
 <154f13b8-1e77-dbe5-4cb0-81c534dbc40b@dd-wrt.com>
 <e98b52a7-ac14-81da-1fab-0c66befcf6d2@candelatech.com>
 <878telw65j.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <73dae55c-4feb-b573-9d02-4942b201bec8@candelatech.com>
Date: Sat, 2 Dec 2017 13:41:07 -0800
MIME-Version: 1.0
In-Reply-To: <878telw65j.fsf@kamboji.qca.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>



On 12/02/2017 06:34 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Is this patch destined for stable?
>>
>> I was expecting to see it show up in the older stable releases,
>> but it has not so far as far as I can tell.
>
> We are working on it, but not sure yet to which releases, it doesn't
> directly apply to all active stable releases.

I had no luck trying to apply it to a 3.17-ish ath10k.  Gave up after
a bit and tried backporting the whole stack instead :P

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
