Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAMmj-0001Kk-K9
 for ath10k@lists.infradead.org; Mon, 03 Feb 2014 16:54:14 +0000
Message-ID: <52EFC99E.2030702@candelatech.com>
Date: Mon, 03 Feb 2014 08:53:50 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] ath10k:  Print out size of wmi-ready-event message.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-2-git-send-email-greearb@candelatech.com>
 <87lhxzdj21.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lhxzdj21.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

On 01/29/2014 05:16 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> I don't like empty commit messages. Just write even a short description
> why the patch is needed.
> 
> And I guess you saw the compiler warning from the build bot for this
> patch?

Actually, if it's convenient, just drop this patch.  It was to debug
what turned out to be improperly packaged firmware, and there is little
chance of ever hitting that in the field.

If instead you need me to fix the compile warning, I'll send an updated
patch.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
