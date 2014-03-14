Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOO1a-0004V1-8R
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 09:03:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: add firmware files
References: <20140314084501.23100.13103.stgit@x230>
 <20140314084514.23100.72654.stgit@x230>
Date: Fri, 14 Mar 2014 11:03:01 +0200
In-Reply-To: <20140314084514.23100.72654.stgit@x230> (Kalle Valo's message of
 "Fri, 14 Mar 2014 10:45:14 +0200")
Message-ID: <87wqfx8856.fsf@kamboji.qca.qualcomm.com>
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
To: ben@decadent.org.uk
Cc: dwmw2@infradead.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Add firmware files for ath10k wireless driver with the new QCA license.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  LICENCE.qca                         |   44 +++++++++++++++++++++++++++++++++++
>  WHENCE                              |    9 +++++++
>  ath10k/QCA988X/hw2.0/board.bin      |  Bin
>  ath10k/QCA988X/hw2.0/firmware-2.bin |  Bin
>  4 files changed, 53 insertions(+)

I forgot to mention in the commit log that the version of this firmware
is 10.1.467.2-1.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
