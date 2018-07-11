Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd4lV-0007u0-2o
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 02:22:02 +0000
Received: by mail-pl0-x244.google.com with SMTP id m16-v6so8450624pls.11
 for <ath10k@lists.infradead.org>; Tue, 10 Jul 2018 19:21:50 -0700 (PDT)
Date: Tue, 10 Jul 2018 19:24:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 0/6] *** Add support for wifi QMI client handshakes ***
Message-ID: <20180711022425.GI2050@tuxbook-pro>
References: <20180706085622.27945-1-govinds@codeaurora.org>
 <20180711012638.GA100410@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180711012638.GA100410@ban.mtv.corp.google.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, niklas.cassel@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, david.brown@linaro.org, andy.gross@linaro.org

On Tue 10 Jul 18:26 PDT 2018, Brian Norris wrote:

> Hi,
> 

Hi Brian,

> On Fri, Jul 06, 2018 at 02:26:17PM +0530, Govind Singh wrote:
[..]
> > https://github.com/andersson/tqftpserv
> 
> FWIW, as of today, the tqftpserv implementation is missing a few headers
> (so it doesn't even build),

Sorry about that, had those lingering in my repository. I've pushed a
fix for this.

> and once I hack things such that it can
> build, it still doesn't work for me (whereas the closed source version
> does). I see some BYE and DEL_CLIENT messages, but no read requests.

I interpret this description as you're not seeing any prints at, beyond
the "[TQFTP] got bye" and "[TQFTP] got del_client"?

That would imply that the remote side doesn't even attempt to
communicate with tqftpserv.

Are you running pd-mapper (either proprietary or my version), is it
complaining about anything?

Can you run qrtr-lookup on the device after booting the modem? So that
we see that the tqftpserv is registered properly and that the modem is
in an appropriate state?

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
