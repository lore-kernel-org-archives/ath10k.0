Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0099.hostedemail.com ([216.40.44.99]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnVNw-0008LR-Bv
 for ath10k@lists.infradead.org; Mon, 22 Jun 2020 22:57:53 +0000
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
From: Nick Marriott <nick@marriott.org>
In-Reply-To: <CA+ASDXNmOvygoKMLOS_saJAzv0oJbYq+u1_6ix-FKbb9U=GB+g@mail.gmail.com>
Date: Mon, 22 Jun 2020 18:57:42 -0400
Message-Id: <24039C4B-E476-4036-B5E6-D062460E1AAB@marriott.org>
References: <24512086-0248-d273-5255-7d6504b0ad2c@gmail.com>
 <CA+ASDXNmOvygoKMLOS_saJAzv0oJbYq+u1_6ix-FKbb9U=GB+g@mail.gmail.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Michael Berg <michaeljberg@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Do you think this patch revert will make it into 5.7 or 5.8?



> On May 27, 2020, at 12:58 PM, Brian Norris <briannorris@chromium.org> wrote:
> 
> On Sat, May 23, 2020 at 7:37 PM Michael Berg <michaeljberg@gmail.com> wrote:
>> 
>> More follow up on the following patch that broke 5GHz AP mode on Compex
>> cards
>> https://github.com/torvalds/linux/commit/2dc016599cfa9672a147528ca26d70c3654a5423
>> 
>> I just downloaded and checked the linux-5.7-rc6 kernel source,
>> and the problematic code is still in drivers/net/wireless/ath/regd.c.
>> 
>> Are they any updates on when this patch will be corrected/reverted?
> 
> I submitted a revert here:
> 
> https://patchwork.kernel.org/patch/11573585/
> 
> Hopefully Kalle can pick that up. Thanks for reporting.
> 
> Brian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
