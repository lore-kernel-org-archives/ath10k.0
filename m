Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWkK6-0008Tq-Q2
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 11:01:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ath10k: add cal_data debugfs file
References: <20140923143219.23585.34114.stgit@potku.adurom.net>
 <20140923143234.23585.2139.stgit@potku.adurom.net>
 <CA+BoTQ=O8j1x-71SCLq9ZiXBU28Ax9M7tyfbvB=mjsWUwgPSjw@mail.gmail.com>
Date: Wed, 24 Sep 2014 14:00:37 +0300
In-Reply-To: <CA+BoTQ=O8j1x-71SCLq9ZiXBU28Ax9M7tyfbvB=mjsWUwgPSjw@mail.gmail.com>
 (Michal Kazior's message of "Wed, 24 Sep 2014 09:00:39 +0200")
Message-ID: <87egv18eqy.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 23 September 2014 16:32, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
>> index 101c6f9cf2a8..426341480262 100644
>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> [...]
>> +static int ath10k_cal_data_open(struct inode *inode, struct file *file)
>
> Shouldn't functions in debug.c have ath10k_debug_ prefix? I'm aware
> other fops stuff doesn't include the _debug word as well so this is
> somewhat consistent with the current code but is this okay in the
> grand scheme of things? Just wondering.

IMHO we should use ath10k_debug_ with fops functions as well, I just
haven't been that picky about that.

I'll change this as well and send v3. Thanks for review!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
