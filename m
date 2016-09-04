Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22d.google.com ([2607:f8b0:4001:c0b::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgNvG-0004Vu-4c
 for ath10k@lists.infradead.org; Sun, 04 Sep 2016 03:16:42 +0000
Received: by mail-it0-x22d.google.com with SMTP id e124so100865432ith.0
 for <ath10k@lists.infradead.org>; Sat, 03 Sep 2016 20:16:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <95a6b65277914d88178ed2b15e182455067cca60.1472490319.git.joe@perches.com>
References: <95a6b65277914d88178ed2b15e182455067cca60.1472490319.git.joe@perches.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 4 Sep 2016 13:16:00 +1000
Message-ID: <CAGRGNgXWM8PiqBb5Tk=RQyqbs099J+mLK34Nq15mYrEgBq6FLg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Spelling and miscellaneous neatening
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
To: Joe Perches <joe@perches.com>
Cc: netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi All,

On Tue, Aug 30, 2016 at 3:05 AM, Joe Perches <joe@perches.com> wrote:
> Correct some trivial comment typos.
> Remove unnecessary parentheses in a long line.
> Convert a return; before the end of a void function definition to just ;
>
> Signed-off-by: Joe Perches <joe@perches.com>

This all looks correct to me. I wish you'd put the code changes in a
separate patch, however it's all noted in the commit log, so...

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
