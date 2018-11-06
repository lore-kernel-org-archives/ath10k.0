Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK40I-00026p-2b
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 16:14:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 4/4] ath10k: snoc: fix unbalanced clock error handling
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-4-briannorris@chromium.org>
 <CAD=FV=XFUeyYZ-LQwYHeQH=b0kBf_wM5ZywpQDS74+_zqeDhEw@mail.gmail.com>
Date: Tue, 06 Nov 2018 18:14:40 +0200
In-Reply-To: <CAD=FV=XFUeyYZ-LQwYHeQH=b0kBf_wM5ZywpQDS74+_zqeDhEw@mail.gmail.com>
 (Doug Anderson's message of "Tue, 16 Oct 2018 16:53:52 -0700")
Message-ID: <87wopqb2tr.fsf@kamboji.qca.qualcomm.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Doug Anderson <dianders@chromium.org> writes:

> Hi,
> On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
>>
>> Similar to regulator error handling, we should only start tearing down
>> the 'i - 1' clock when clock 'i' fails to enable. Otherwise, we might
>> end up with an unbalanced clock, where we never successfully enabled the
>> clock, but we try to disable it anyway.
>>
>> Signed-off-by: Brian Norris <briannorris@chromium.org>
>
> Presumably you could have a Fixes tag just to help folks, like:
>
> Fixes: a6a793f98786 ("ath10k: vote for hardware resources for WCN3990")

Thanks, I added that in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
