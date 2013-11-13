Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgWIm-0001Ln-Gm
 for ath10k@lists.infradead.org; Wed, 13 Nov 2013 08:59:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: add phyerr/dfs handling
References: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
 <87bo1xuajk.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=oj2hg6zRf5rKyDBexWOdR08=aRXRJtD9gQQs7i_tjjMQ@mail.gmail.com>
 <87habnau4d.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 13 Nov 2013 10:59:27 +0200
In-Reply-To: <87habnau4d.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Fri, 8 Nov 2013 15:41:22 +0200")
Message-ID: <87r4ak8yog.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>> I think we can use here spin_lock_bh(&ar->data_lock) when setting
>> ar->debug.dfs_stats and when reading this from debugfs.
>> But, is that really needed (in worst case we will get older values via debugfs)?
>
> I would prefer not to have any race conditions in the driver, even if
> it's just statistics. If there's only a race with statistics atomic
> variables are also one option.

I took a new look at these statistics and I think you are right. It
feels a bit overkill to use locking or atomic variables here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
