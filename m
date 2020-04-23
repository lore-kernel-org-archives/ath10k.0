Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRVuP-00009u-UQ
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 07:04:31 +0000
MIME-Version: 1.0
Date: Thu, 23 Apr 2020 15:04:26 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
In-Reply-To: <87k12fr4q7.fsf@kamboji.qca.qualcomm.com>
References: <5971a327-d11a-35e6-8295-8dfb8ae3a434@yandex.ru>
 <87k12fr4q7.fsf@kamboji.qca.qualcomm.com>
Message-ID: <9cc7efbb3c9b29e4553a427e6f58725f@codeaurora.org>
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
Cc: svp <svpm@yandex.ru>, ath10k@lists.infradead.org

On 2020-04-16 20:32, Kalle Valo wrote:
> svp <svpm@yandex.ru> writes:
> 
>> I need help with my softAP installation.
>> Compex WLE600VX miniPCIe card can't start at 5GHz AP mode after update
>> to kernel 5.6 on ArchLinux
>> With kernel 5.5.x and LTS all is OK
>> Some logs and details is in this ArchLinux forum topic
>> https://bbs.archlinux.org/viewtopic.php?id=254535
> 
> So if I read the link correctly this commit causes the regression 
> (which
> was introduced in v5.6-rc1):
> 
> commit 2dc016599cfa9672a147528ca26d70c3654a5423
> Author:     Wen Gong <wgong@codeaurora.org>
> AuthorDate: Fri Nov 29 07:34:09 2019 +0000
> Commit:     Kalle Valo <kvalo@codeaurora.org>
> CommitDate: Mon Dec 2 12:08:01 2019 +0200
> 
>     ath: add support for special 0x0 regulatory domain
> 
> Wen, please take a look. Should I revert this commit? Regressions are
> not ok.
Yes, please revert it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
