Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsyUl-0005zO-CR
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 18:36:19 +0000
Message-ID: <54737A8C.40102@candelatech.com>
Date: Mon, 24 Nov 2014 10:35:56 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Do not limit RTS threshold value to 2347
References: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
In-Reply-To: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org

On 11/24/2014 03:57 AM, Vivek Natarajan wrote:
> Increase the rts threshold from the legacy value of 2347 to support higher
> threshold limit.

Does any firmware actually support RTS?  It didn't work last I tested
it on 10.1.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
