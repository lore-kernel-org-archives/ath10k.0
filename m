Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJA3G-0003Wn-Ry
 for ath10k@lists.infradead.org; Mon, 09 Sep 2013 22:35:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: define ath10k_debug_start/_stop as static inline
References: <1378741845-30080-1-git-send-email-bartosz.markowski@tieto.com>
Date: Tue, 10 Sep 2013 01:34:39 +0300
In-Reply-To: <1378741845-30080-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Mon, 9 Sep 2013 17:50:45 +0200")
Message-ID: <87mwnl7hfk.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Otherwise if CONFIG_ATH10K_DEBUGFS won't be set we will
> end up with multiple definitions and compilation failure
> in each place the header is included.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Doh, I broke this. Sorry about that. Path applied, thanks for fixing
this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
