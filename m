Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNbam-0001VW-J6
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 11:47:49 +0000
MIME-Version: 1.0
Date: Thu, 24 Oct 2019 17:17:46 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry flag to skip SCM call for
 msa region
In-Reply-To: <87a79qk431.fsf@codeaurora.org>
References: <20191023094014.28683-1-govinds@codeaurora.org>
 <20191023094014.28683-2-govinds@codeaurora.org>
 <87a79qk431.fsf@codeaurora.org>
Message-ID: <94b02ec85c272d9d195572c40fcc3c09@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,

On 2019-10-24 12:44, Kalle Valo wrote:
> Govind Singh <govinds@codeaurora.org> writes:
> 
>> Add boolean context flag to disable SCM call for statically
>> mapped msa region.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> 
> Oddly this didn't apply, but 3-way merge did work. Please double check
> the result in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=6f308524cf602ed9a0dbb0b0b50ba625b9091879

Change looks good to me.


BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
