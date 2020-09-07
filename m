Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJit-0003p8-9o
 for ath10k@lists.infradead.org; Mon, 07 Sep 2020 16:10:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/2] ath10k: Add chain-1 voltage regulator voting
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=WTnULQs5skJiXfp+srsx5e8DeqW3uu2SEDVGoEmP2O1g@mail.gmail.com>
Date: Mon, 7 Sep 2020 16:10:24 +0000
In-Reply-To: <CAD=FV=WTnULQs5skJiXfp+srsx5e8DeqW3uu2SEDVGoEmP2O1g@mail.gmail.com>
 (Doug Anderson's message of "Mon, 24 Aug 2020 16:50:33 -0700")
Message-ID: <0101017469552d42-e1d0ceb7-dbf3-4222-aa86-781067bc7ea6-000000@us-west-2.amazonses.com>
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
To: Doug Anderson <dianders@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Doug Anderson <dianders@chromium.org> writes:

> Hi,
>
> On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>>
>> Add the support to vote for the chain-1
>> voltage regulator for WCN3990. This is
>> added as an optional property.
>>
>> Rakesh Pillai (2):
>>   dt: bindings: Add new regulator as optional property for WCN3990
>>   ath10k: Add support for chain1 regulator supply voting
>>
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
>>  drivers/net/wireless/ath/ath10k/snoc.c                         | 1 +
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> This series is marked as "Awaiting Upstream" in patchwork.  I don't
> see anything blocking it landing now.

Thanks, moved it to New state now.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
