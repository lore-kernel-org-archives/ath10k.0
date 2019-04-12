Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwXI-0003k8-Dq
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:48:10 +0000
Date: Fri, 12 Apr 2019 15:48:02 +0200
From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 1/4] lib/hexdump.c: Allow 64 bytes per line
Message-ID: <20190412134802.kprel2c2iqijd4ai@pathway.suse.cz>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-2-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410031720.11067-2-alastair@au1.ibm.com>
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
To: Alastair D'Silva <alastair@au1.ibm.com>
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, alastair@d-silva.org, intel-gfx@lists.freedesktop.org, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Wed 2019-04-10 13:17:17, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> With modern high resolution screens, we can display more data, which makes
> life a bit easier when debugging.

I have quite some doubts about this feature.

We are talking about more than 256 characters per-line. I wonder
if such a long line is really easier to read for a human.

I am not expert but there is a reason why the standard is 80
characters per-line. I guess that anything above 100 characters
is questionable. https://en.wikipedia.org/wiki/Line_length
somehow confirms that.

Second, if we take 8 pixels per-character. Then we need
2048 to show the 256 characters. It is more than HD.
IMHO, there is still huge number of people that even do
not have HD display, especially on a notebook.


I am sorry but I am strongly against having this hardcoded
anywhere. And I doubt that there will be enough users
to complicate the code and make it configurable.

Best Regards,
Petr

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
