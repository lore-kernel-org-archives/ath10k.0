Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHsil-0003Se-DI
 for ath10k@lists.infradead.org; Fri, 06 Sep 2013 09:52:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: set the UART baud rate to 19200
References: <1378211043-20299-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 6 Sep 2013 12:52:26 +0300
In-Reply-To: <1378211043-20299-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 3 Sep 2013 14:24:02 +0200")
Message-ID: <87a9jqi8f9.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> When configuring the host_interests over BMI, set the UART
> baud rate to 19200. This is valid for QCA988X_2.0 devices.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, both patches applied.

To first patch I added this:

    kvalo: found during code review, there should not be any functionality
    changes

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
