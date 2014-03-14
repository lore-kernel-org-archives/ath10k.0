Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WORSF-0001zx-Gd
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 12:43:16 +0000
Received: by mail-lb0-f170.google.com with SMTP id s7so1754865lbd.29
 for <ath10k@lists.infradead.org>; Fri, 14 Mar 2014 05:42:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140314084514.23100.72654.stgit@x230>
References: <20140314084501.23100.13103.stgit@x230>
 <20140314084514.23100.72654.stgit@x230>
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Date: Fri, 14 Mar 2014 05:36:53 -0700
Message-ID: <CAB=NE6WW8yX4kdy02j2fT4g0JvYj4a_XkiqYtXKZSMB7FHuwNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: add firmware files
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Ben Hutchings <ben@decadent.org.uk>, ath10k@lists.infradead.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Fri, Mar 14, 2014 at 1:45 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> +* No Reverse engineering, decompiling, decrypting, or disassembling of
> +  this software is permitted.

We have other firmware licenses that have this language already on
linux-firmware but let us also keep in mind that linux-firmware will
likely not only be used by Linux folks.

<-- cut -->

> + NO LICENSES OR OTHER RIGHTS,
> +WHETHER EXPRESS, IMPLIED, BASED ON ESTOPPEL OR OTHERWISE, ARE GRANTED
> +TO ANY PARTY'S PATENTS, PATENT APPLICATIONS, OR PATENTABLE INVENTIONS
> +BY VIRTUE OF THIS LICENSE OR THE DELIVERY OR PROVISION BY QUALCOMM
> +ATHEROS, INC. OF THE SOFTWARE.

This -- however is new to linux-firmware -- and I hereby raise a big
red fucking flag. All other licenses on linux-firmware provide at the
very least a limited patent grant. What makes Qualcomm special ?

> +FOR ANY DIRECT DAMAGES ARISING UNDER OR RESULTING FROM
> +THIS AGREEMENT OR IN CONNECTION WITH ANY USE OF THE SOFTWARE SHALL NOT
> +EXCEED A TOTAL AMOUNT OF US$5.00.

WTF - was this inspired by a Sci-Fi movie?

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
