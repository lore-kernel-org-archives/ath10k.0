Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHTmO-0008Lp-Hb
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 09:24:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: qca6174 hw2.1 firmware crash with kernel 4.1.2
References: <CAMQd7maa410JYZL7CvX+us99-ZjUNKMCPjK6cRBJFUY4NBj=0g@mail.gmail.com>
 <CAMQd7mb8o4__K+D-+HhJ07M773b96HiXwLqmwGBU0-oLNdhXGA@mail.gmail.com>
Date: Tue, 21 Jul 2015 12:23:38 +0300
In-Reply-To: <CAMQd7mb8o4__K+D-+HhJ07M773b96HiXwLqmwGBU0-oLNdhXGA@mail.gmail.com>
 (Enrico Tagliavini's message of "Sun, 19 Jul 2015 11:51:50 +0200")
Message-ID: <87pp3lq2xx.fsf@kamboji.qca.qualcomm.com>
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: ath10k@lists.infradead.org

Enrico Tagliavini <enrico.tagliavini@gmail.com> writes:

> Mhm seems like I assumed the backport missing from 4.0 was merged for
> 4.1.... but it is not, it's in 4.2 only. Any chance you'll ask for a
> backport of this 4 lines patch?
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath10k?id=11a002efbaa7fbd9f6e616695ab42aa9f1caf060
>
> Would be much appreciated

Thanks for the suggestion, I'll send the patch to 4.1 stable releases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
