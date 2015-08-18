Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRiFp-0003ue-62
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 14:52:45 +0000
Message-ID: <55D34698.50204@candelatech.com>
Date: Tue, 18 Aug 2015 07:52:08 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Unable to set channel above 100 with latest CT Kernel and Firmware
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
 <1439738757-29199-4-git-send-email-me@bobcopeland.com>
 <55D1C02F.4010005@tu-bs.de> <874mjwdd6y.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874mjwdd6y.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, "Harms, Hannes" <hannes.harms@tu-bs.de>
Cc: ath10k@lists.infradead.org



On 08/18/2015 04:54 AM, Kalle Valo wrote:
> "Harms, Hannes" <hannes.harms@tu-bs.de> writes:
>
>> I am trying to set up the latest Kernel (4.2rc6) and firmware
>> (10.1.467-ct-14) form Candela for a 5Ghz network.
>> Unfortunately I am not able to set channels above 100, although
>> regulatory domain is set to DE.
>> Maybe someone has an advice what is going wrong?

This is unlikely to be a firmware issue, as we routinely run on channel 149.

Have you tried an older kernel to see if it is a regression somewhere in
the stack/driver?

Thanks,
Ben

>
> Btw, please don't hijack threads (ie. reply to an existing thread and
> change subject) as it confuses patchwork[1]. Instead start a new thread.
>
> [1] https://patchwork.kernel.org/patch/7023511/
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
