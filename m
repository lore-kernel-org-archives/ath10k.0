Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z05QD-0002Gx-QV
 for ath10k@lists.infradead.org; Wed, 03 Jun 2015 09:57:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Debugfs entry to enable/disable WLAN&Blutooth
 Coexist feature
References: <1432840745-21725-1-git-send-email-yanbol@qca.qualcomm.com>
 <CAFqt6zbpEfX_DPwZwzVZkcUD3uuYa=-Ujuo9PXcB+-HtM9b8tA@mail.gmail.com>
Date: Wed, 3 Jun 2015 12:56:47 +0300
In-Reply-To: <CAFqt6zbpEfX_DPwZwzVZkcUD3uuYa=-Ujuo9PXcB+-HtM9b8tA@mail.gmail.com>
 (Souptick Joarder's message of "Wed, 3 Jun 2015 09:05:15 +0530")
Message-ID: <87iob5t8rk.fsf@kamboji.qca.qualcomm.com>
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
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: dreamfly281@gmail.com, Yanbo Li <yanbol@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Souptick Joarder <jrdr.linux@gmail.com> writes:

> From patch it looks like we can optimize the size of char buf [32] to
> 16 /8 as it is only going to store 0 or 1. If there are some other
> purpose to keep it 32 , then I apologize for the noise.

I'm going to send v3 which will use dev_flags bitmap.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
