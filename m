Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vv67e-0008Pu-Me
 for ath10k@lists.infradead.org; Mon, 23 Dec 2013 14:04:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add set_bitrate_mask callback
References: <1387653946-2988-1-git-send-email-janusz.dziedzic@tieto.com>
 <87d2koxd8m.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=q4qgexWTfmmizt5+kNjkM6MfscYp=0VvEnj4YMHrRc1A@mail.gmail.com>
Date: Mon, 23 Dec 2013 16:04:14 +0200
In-Reply-To: <CALhHN=q4qgexWTfmmizt5+kNjkM6MfscYp=0VvEnj4YMHrRc1A@mail.gmail.com>
 (Janusz Dziedzic's message of "Mon, 23 Dec 2013 14:55:12 +0100")
Message-ID: <87k3evvf35.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

>> Bitfields are frowned upon in kernel, better to use SM() and MS().
>>
> I don't use them, just put as a documentation.

Ok, then you can just document that within comments.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
