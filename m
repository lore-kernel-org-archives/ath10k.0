Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYWpE-00007v-3e
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 09:33:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix htt t2h message conflicts among firmware
 revisions
References: <1426066382-481-1-git-send-email-rmanohar@qti.qualcomm.com>
 <878uetl7cn.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmcdiy3u8cvYYRueSoQxGzYf9Suf4dy8HpLG6UaQzJzZQ@mail.gmail.com>
Date: Thu, 19 Mar 2015 11:32:37 +0200
In-Reply-To: <CA+BoTQmcdiy3u8cvYYRueSoQxGzYf9Suf4dy8HpLG6UaQzJzZQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 19 Mar 2015 09:40:39 +0100")
Message-ID: <87r3sljpsa.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> When I was adding WMI_OP_VERSION, my idea was that we will add similar
>> version for HTT as well once we need it. But I guess this is good enough
>> for now, we can add HTT_OP_VERSION later if more changes are needed.
>
> Maybe it should be renamed to OP_VERSION (drop the WMI_) or BRANCH_ID
> or something else?
>
> It's not like HTT wasn't diverging. It was. However only WMI ABI was
> seeing major breakage that needed taking care of. HTT changes were
> small enough and could be ignored until now.

I'm a bit worried that having one id for everything will be more
difficult to maintain, that's why I created WMI_OP_VERSION in the first
place. IMHO it's lot cleaner codewise to have one id for WMI interface
and one id for HTT (eg. HTT_OP_VERSION). What do you think?

> Perhaps the rename could be accompanied by FW API bump to 5?

Maybe not the rename, but yeah, something should be decided before the
bump up.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
