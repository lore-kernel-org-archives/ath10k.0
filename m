Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsYe4-0003cE-U7
 for ath10k@lists.infradead.org; Mon, 16 Dec 2013 13:55:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: split the if_limits and if_comb
References: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
 <52A734D9.3000506@candelatech.com>
Date: Mon, 16 Dec 2013 15:55:14 +0200
In-Reply-To: <52A734D9.3000506@candelatech.com> (Ben Greear's message of "Tue, 
 10 Dec 2013 07:35:53 -0800")
Message-ID: <87ob4ggat9.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Ben Greear <greearb@candelatech.com> writes:

> On 12/10/2013 07:20 AM, Bartosz Markowski wrote:
>> Split the interface limits and inteface combination,
>> to reflect the 10.X capabilites (no P2P, no STA and 8 VAP).
>
> My 10.X firmware works just fine with stations..I just tested up
> to 32 of them.
>
> Maybe add firmware IEs to explicitly advertise how many it can
> support instead of setting one flag and making assumptions?

That can be done in a separate patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
