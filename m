Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <1383853221.9263.14.camel@joe-AO722>
Subject: Re: [PATCH] wcn36xx: Fix logging macro with unnecessary semicolon
From: Joe Perches <joe@perches.com>
Date: Thu, 07 Nov 2013 11:40:21 -0800
In-Reply-To: <CAFSJ42Y-3BZqj+JRNa8wdxjnm1fguD8ToH5Oj0m56yT5NexdVQ@mail.gmail.com>
References: <1383684000.4387.42.camel@joe-AO722>
 <CAFSJ42YQy96Sko8CuG9BGjHzTV7TkRp2=NVt036APxSKpPB=Ag@mail.gmail.com>
 <1383760556.7940.28.camel@joe-AO722>
 <CAFSJ42Y-3BZqj+JRNa8wdxjnm1fguD8ToH5Oj0m56yT5NexdVQ@mail.gmail.com>
Mime-Version: 1.0
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
To: Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: wil6210@qca.qualcomm.com, netdev@vger.kernel.org, ath5k-devel@lists.ath5k.org, linux-wireless <linux-wireless@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, ath9k-devel <ath9k-devel@lists.ath9k.org>, Kalle Valo <kvalo@qca.qualcomm.com>, wcn36xx <wcn36xx@lists.infradead.org>

On Thu, 2013-11-07 at 07:32 +0000, Eugene Krasnikov wrote:
> Hi Joe,

Hi Eugene.

> I personally like the idea of making some kind of framework on top of
> printing because all ath drivers are using the same printing approach
> and combining all that code in one place will reduce amount of code in
> each particular driver. As a true engineer i like when it's less code
> = less work to do = less bugs:)
> 
> Suggestion is to send a patch with semicolon fix only

It's a one line fix, and pretty trivial to do yourself if you
want it.

I do think though the slightly odd wcn36xx_<level> uses of:

-#define wcn36xx_err(fmt, arg...)                               \
-       printk(KERN_ERR pr_fmt("ERROR " fmt), ##arg);
-
-#define wcn36xx_warn(fmt, arg...)                              \
-       printk(KERN_WARNING pr_fmt("WARNING " fmt), ##arg)
-
-#define wcn36xx_info(fmt, arg...)              \
-       printk(KERN_INFO pr_fmt(fmt), ##arg)
-
[]
+#define wcn36xx_err(fmt, ...)                                  \
+       pr_err("ERROR " fmt, ##__VA_ARGS__)
+#define wcn36xx_warn(fmt, ...)                                 \
+       pr_warn("WARNING " fmt, ##__VA_ARGS__)
+#define wcn36xx_info(fmt, ...)                                 \
+       pr_info(fmt, ##__VA_ARGS__)

should still be converted to more normal pr_<level> like I did.

I don't believe that prefixing of "ERROR " and "WARNING " to
pr_err and pr_warn actually gain anything as the same level
information can be got already with dmesg -r via the "<3>" and
"<4>" prefixes or dmesg -l3 -l4

> have a
> second round of convincing ath guys to change printing code. How does
> that sound?

Luis?  Kalle?  Other Qualcomm/Atheros folk?

One of the nominal benefits of separating the ath_<level>
macros by subsystem was perf/tracing.  I believe some of the
ath subsystems have integrated the dmesg and tracing code.

I'm not sure how separable those may be here or if it's even
desirable to separate them.  I'd guess not.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
