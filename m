Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGmNt-0006QB-Rx
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 10:31:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:Prevent setting wrong key idx for station
References: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
 <54C7C3B7.4020706@candelatech.com>
Date: Thu, 29 Jan 2015 12:31:07 +0200
In-Reply-To: <54C7C3B7.4020706@candelatech.com> (Ben Greear's message of "Tue, 
 27 Jan 2015 08:58:31 -0800")
Message-ID: <87fvat3ml0.fsf@kamboji.qca.qualcomm.com>
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
Cc: senthilb@qti.qualcomm.com, SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 01/27/2015 06:30 AM, senthilb@qti.qualcomm.com wrote:
>> From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
>> 
>> Ath10k driver sets wrong default key idx that results in
>> sending unicast frames with multicast key.
>
> Is this something that should be back-ported to stable releases?

Sure, if somebody cares about WEP that much :) 

Should I add CC stable to the patch?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
