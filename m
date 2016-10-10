Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btczw-00020h-E4
 for ath10k@lists.infradead.org; Mon, 10 Oct 2016 16:00:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: cache calibration data when the core is stopped
Date: Mon, 10 Oct 2016 15:59:44 +0000
Message-ID: <871szojits.fsf@kamboji.qca.qualcomm.com>
References: <1475699037-136212-1-git-send-email-mfaltesek@google.com>
 <8760p0jlv4.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA8yX6bnLWHTwMc21EJHh4tQHpdBH+yKL4Y9WWxufBKaKQ@mail.gmail.com>
In-Reply-To: <CAOiWkA8yX6bnLWHTwMc21EJHh4tQHpdBH+yKL4Y9WWxufBKaKQ@mail.gmail.com>	(Marty
 Faltesek's message of "Mon, 10 Oct 2016 11:01:05 -0400")
Content-Language: en-US
Content-ID: <BF42D33742474D4B9C34E429D0B5AC05@qualcomm.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marty Faltesek <mfaltesek@google.com> writes:

> ath10k: cache calibration data when the core is stopped
>
> Caching calibration data allows it to be accessed when the
> device is not active.
>
> Signed-off-by: Marty Faltesek <mfaltesek@google.com>

Thanks, I'll now send v3.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
