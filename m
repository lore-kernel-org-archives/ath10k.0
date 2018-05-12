Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQUj-0008S9-IV
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:07:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: remove variables which set but not used
References: <20180507093948.GA7905@blackstone>
 <4abfd7695766fe156187a12c00320a55@codeaurora.org>
 <4abd25ee9bfcb0a41c5c4cda6e19972b@codeaurora.org>
Date: Sat, 12 May 2018 12:06:57 +0300
In-Reply-To: <4abd25ee9bfcb0a41c5c4cda6e19972b@codeaurora.org> (Jeff Johnson's
 message of "Tue, 08 May 2018 07:53:22 -0700")
Message-ID: <87in7tz1hq.fsf@purkki.adurom.net>
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
To: Jeff Johnson <jjohnson@codeaurora.org>
Cc: Linux Wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Jeff Johnson <jjohnson@codeaurora.org> writes:

> On 2018-05-07 02:39, Kenneth Lu wrote:
>> Variable buf_len and num_vdev_stats are bging assigned but never read.
>
> typo: bging => being

I fixed this in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
