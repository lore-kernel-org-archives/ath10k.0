Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWqS-0000KI-E6
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 07:17:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Do not limit RTS threshold value to 2347
References: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
 <54737A8C.40102@candelatech.com>
Date: Wed, 26 Nov 2014 09:16:29 +0200
In-Reply-To: <54737A8C.40102@candelatech.com> (Ben Greear's message of "Mon,
 24 Nov 2014 10:35:56 -0800")
Message-ID: <87zjbewhwy.fsf@kamboji.qca.qualcomm.com>
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
Cc: Vivek Natarajan <nataraja@qti.qualcomm.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 11/24/2014 03:57 AM, Vivek Natarajan wrote:
>> Increase the rts threshold from the legacy value of 2347 to support higher
>> threshold limit.
>
> Does any firmware actually support RTS?  It didn't work last I tested
> it on 10.1.

Vivek?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
