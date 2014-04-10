Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY8oq-0003Gc-7k
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 06:50:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFTv2 3/5] ath10k: rework peer accounting
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
Date: Thu, 10 Apr 2014 09:50:02 +0300
In-Reply-To: <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 9 Apr 2014 12:48:49 +0200")
Message-ID: <87ob09he5h.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> It was troublesome to iterate over peers and
> perform sleepable calls. This will be necessary
> for some upcomming changes to tx flushing.
>
> Make peer allocation and initial setup
> protected by both ar->conf_mutex and
> ar->data_lock. This way it's possible to iterate
> over peers with conf_mutex and call sleepable
> functions.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Sorry, but I'm not really getting your idea here of using both
conf_mutex and data_lock to protect ar->peers. Can you elaborate more,
please? Why can't we just use conf_mutex then? What am I missing?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
