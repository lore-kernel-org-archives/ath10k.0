Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgFYV-0008Ha-1F
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 18:52:57 +0000
Received: by mail-ot0-x236.google.com with SMTP id k4so74736200otc.0
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 10:52:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170221.131858.949421414784612398.davem@davemloft.net>
References: <alpine.LSU.2.20.1702201508280.24579@cbobk.fhfr.pm>
 <CA+55aFxLmgA7drrGfUJmCRPT-A74ROYf6GQHFGO5pzVjZ0dL7Q@mail.gmail.com>
 <87d1eb99dq.fsf_-_@purkki.adurom.net>
 <20170221.131858.949421414784612398.davem@davemloft.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Feb 2017 10:52:33 -0800
Message-ID: <CA+55aFyqH3WAKsD_AaCe905zJbPzTXGygu2eiD1L0d6c2sAkGA@mail.gmail.com>
Subject: Re: ath10k regression on XPS13
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
To: David Miller <davem@davemloft.net>
Cc: "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, Jiri Kosina <jikos@kernel.org>, Linux Wireless List <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>

On Tue, Feb 21, 2017 at 10:18 AM, David Miller <davem@davemloft.net> wrote:
>
> Kalle I really wanted to send my net-next pull request to Linus later
> today.  But I guess I have to wait for this ath10k first.

Feel free to send it to me - it sounds like the regression is
 (a) easy to work around
and
 (b) has a fix coming up.

And it won't even be something that I personally notice, since I have
the prev-gen XPS13 that has intel wireless.

              Linus

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
