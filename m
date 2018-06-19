Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVAtk-0003OR-Mj
 for ath10k@lists.infradead.org; Tue, 19 Jun 2018 07:17:53 +0000
MIME-Version: 1.0
Date: Tue, 19 Jun 2018 12:47:41 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
In-Reply-To: <87muvrdza9.fsf@qca.qualcomm.com>
References: <20180605123304.31969-1-govinds@codeaurora.org>
 <20180619021742.GA17220@rodete-desktop-imager.corp.google.com>
 <974e34efd334d921e49d08df879c1b97@codeaurora.org>
 <87muvrdza9.fsf@qca.qualcomm.com>
Message-ID: <373f5fb7f2790f4037dc004c3acb09d5@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

Hi Kalle,

On 2018-06-19 12:43, Kalle Valo wrote:
> Govind Singh <govinds@codeaurora.org> writes:
> 
>> 3) once supported pd info in known to Q6, tftp client in Q6
>> establishes the connection with tftp server in Q6 for user pd loading.
> 
> This sentence doesn't make sense, should it be that the tftp client in
> Q6 establishes the connection with the tftp server in user space?

Yes, you are right. TFTP server is running in apps user-space and client 
on Q6 root pd.

BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
