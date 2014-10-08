Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XboQa-0007nz-G3
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 10:25:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix WMI scan command length
References: <1412677603-11748-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Wed, 8 Oct 2014 13:24:17 +0300
In-Reply-To: <1412677603-11748-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 7 Oct 2014 12:26:43 +0200")
Message-ID: <87oatmg8q6.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Fix WMI scan command length we setup when scan request.
>
> This fix issue with 636 firmware when scan always failed
> with message:
>
> ath10k_pci 0000:02:00.0: wmi start scan
> ath10k_pci 0000:02:00.0: wmi stop scan reqid 1 req_type 0 vdev/scan_id 0
> ath10k_pci 0000:02:00.0: failed to stop wmi scan: -11
> ath10k_pci 0000:02:00.0: failed to stop scan: -11
> ath10k_pci 0000:02:00.0: failed to start hw scan: -110
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
