Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihDcb-00008N-Iy
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 14:14:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry flag to skip SCM call
 for msa region
References: <20191111042508.12628-1-govinds@codeaurora.org>
 <20191111042508.12628-2-govinds@codeaurora.org>
 <20191114191640.GA8426@bogus>
 <0101016e8d2426fc-31499903-e1a0-44b3-83eb-73ba4f4a8b4a-000000@us-west-2.amazonses.com>
Date: Tue, 17 Dec 2019 16:14:36 +0200
In-Reply-To: <0101016e8d2426fc-31499903-e1a0-44b3-83eb-73ba4f4a8b4a-000000@us-west-2.amazonses.com>
 (govinds@codeaurora.org's message of "Thu, 21 Nov 2019 08:46:27
 +0000")
Message-ID: <87pngnavjn.fsf@kamboji.qca.qualcomm.com>
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
To: govinds@codeaurora.org
Cc: Rob Herring <robh@kernel.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org

govinds@codeaurora.org writes:

> On 2019-11-15 00:46, Rob Herring wrote:
>> On Mon, Nov 11, 2019 at 09:55:07AM +0530, Govind Singh wrote:
>>> Add boolean context flag to disable SCM call for statically
>>> mapped msa region.
>>
>> Can't this be implied by the compatible string?
>>
>
> same soc compatible will be used in older TZ vs new TZ.
> Due to this reason I added this.

So what should we do? Rob, any suggestions?

Full patch here:

https://patchwork.kernel.org/patch/11236535/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
