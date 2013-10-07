Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT9tv-0002vc-Jq
 for ath10k@lists.infradead.org; Mon, 07 Oct 2013 12:27:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: advestise 10.X fw support on wmi_attach
References: <1380696532-4147-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 7 Oct 2013 15:26:36 +0300
In-Reply-To: <1380696532-4147-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 2 Oct 2013 08:48:51 +0200")
Message-ID: <8738oduv0j.fsf@kamboji.qca.qualcomm.com>
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

> Since the WMI API has been added and we can detect from the
> FW IEs what firmware variant we deal with, turn on 10.X support.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, both patches applied. For patch 1 I changed the commit log a bit
as we don't really advertise anything to user space:

commit 8acd3c97ff9ea803513c55f89d3f1832481b5b76
Author: Bartosz Markowski <bartosz.markowski@tieto.com>
Date:   Wed Oct 2 08:48:51 2013 +0200

    ath10k: enable 10.x firmware branch support
    
    Since the WMI API has been added and we can detect from the
    FW IEs what firmware variant we deal with, turn on support
    for 10.x firmware branch in ath10k_wmi_attach().
    
    kvalo: improve the commit log
    
    Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
