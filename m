Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVApt-0001pP-BF
 for ath10k@lists.infradead.org; Tue, 19 Jun 2018 07:13:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
Date: Tue, 19 Jun 2018 07:13:37 +0000
Message-ID: <87muvrdza9.fsf@qca.qualcomm.com>
References: <20180605123304.31969-1-govinds@codeaurora.org>
 <20180619021742.GA17220@rodete-desktop-imager.corp.google.com>
 <974e34efd334d921e49d08df879c1b97@codeaurora.org>
In-Reply-To: <974e34efd334d921e49d08df879c1b97@codeaurora.org> (Govind Singh's
 message of "Tue, 19 Jun 2018 09:36:05 +0530")
Content-Language: en-US
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
To: Govind Singh <govinds@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "andy.gross@linaro.org" <andy.gross@linaro.org>

Govind Singh <govinds@codeaurora.org> writes:

> 3) once supported pd info in known to Q6, tftp client in Q6
> establishes the connection with tftp server in Q6 for user pd loading.

This sentence doesn't make sense, should it be that the tftp client in
Q6 establishes the connection with the tftp server in user space?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
