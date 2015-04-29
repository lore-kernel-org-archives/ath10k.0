Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from edge10.ethz.ch ([82.130.75.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnRV4-0005V0-Vh
 for ath10k@lists.infradead.org; Wed, 29 Apr 2015 12:54:04 +0000
From: "Costa Molero  Edgar" <cedgar@student.ethz.ch>
Subject: RE: Modifing and installing ath10k driver for kernel 4.0
Date: Wed, 29 Apr 2015 12:53:36 +0000
Message-ID: <BB63CF2605733841BD56CD9C38AC1F7E1F34B2F7@MBX13.d.ethz.ch>
References: <BB63CF2605733841BD56CD9C38AC1F7E1E678CA8@MBX23.d.ethz.ch>
 <CA+BoTQmGCnAepE0OWEiO1ASrLEbsmrKqf2zS-s2WpAbkhX4vaw@mail.gmail.com>,
 <87383k70kf.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87383k70kf.fsf@kamboji.qca.qualcomm.com>
Content-Language: ca-ES
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> You can still use backports though. All you need is to build backports
> package yourself[1] from whatever kernel tree you desire, e.g.
> github.com/kvalo/ath instead of using the pre-built one.
>
> [1]: https://backports.wiki.kernel.org/index.php/Documentation/backports/hacking

> I also wrote something about ath10k and backports:

> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports


Thanks, for the answers. 

I already tried before writing my message to compile my custom ath10k backports. However when I was following your guide I was not able to create the backports output tree. The gentree.py script was giving me a dependency problem :

You need to have installed: spatch >= 1.0.0-rc24
Try installing the package: coccinelle

So, I did installed the latest coccinelle version but the dependency was still there. After one day struggling I found that its a bug and can be solved with this patch :

---
 lib/bpreqs.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/bpreqs.py b/lib/bpreqs.py
index 6c46670..4399c6d 100644
--- a/lib/bpreqs.py
+++ b/lib/bpreqs.py
 <at>  <at>  -98,7 +98,7  <at>  <at>  class Req:
                 if (rc == ""):
                     rc = 0
                 else:
-                    rc = int(rc) - 20
+                    rc = int(rc) - 40
                 extra = int(rc)
             else:
                 extra = int(rel_specs['EXTRAVERSION']) + 10
--

I still have a question regarding backports, and kernel releases. I am quite new in all this world so that's why I was a little bit confused.  Correct me if I am wrong. Backports are used to install the newest (or whatever version ) of drivers in the current kernel you have, right ? So you get the same result than compiling the entire kernel with your modified driver ? 

Edgar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
