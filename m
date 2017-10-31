Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f171.google.com ([209.85.223.171])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9Z8R-00040w-V1
 for ath10k@lists.infradead.org; Tue, 31 Oct 2017 16:11:29 +0000
Received: by mail-io0-f171.google.com with SMTP id m81so36262832ioi.13
 for <ath10k@lists.infradead.org>; Tue, 31 Oct 2017 09:11:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171031065122.GA24662@gmail.com>
References: <20171031065122.GA24662@gmail.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Tue, 31 Oct 2017 17:10:25 +0100
Message-ID: <CAGnkfhz=XJUQrXJR-ZbNxk+gBN_bh8+qYzv=_V_KhV0mV2+tmg@mail.gmail.com>
Subject: Re: PROBLEM: Issue with wireless driver after resume from suspend.
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
To: Anil Nair <anilcoll90@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Oct 31, 2017 at 7:51 AM, Anil Nair <anilcoll90@gmail.com> wrote:
> Hi All,
>
> I am having a issue with the wireless driver in my laptop. Attached information
> pertaining to the issue.
>
>   [1.] One line summary of the problem:
>
>   Wifi not working after resuming from suspend state.
>
>   [2.] Full description of the problem/report:
>
>   I had put my laptop in suspend mode, after resmuing the laptop from suspend
>   mode wifi stopped working, or rather not responding I tried switching the
>   airplane mode on then off still no effect.
>
>   [3.] Keywords (i.e., modules, networking, kernel):
>
>   Networking particularly Wireless Networking.
>
>   [4.] Kernel information
>
>   4.13.5
>
>   [4.1.] Kernel version (from /proc/version):
>
>   Linux version 4.13.5anil-1017 (root@anilnair-lenovo)
>   (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.5))
>   #1 SMP Sat Oct 14 12:30:16 IST 2017
>
>   [4.2.] Kernel .config file:
>
>   Attached in the below mail file named config_kernel.txt
>
>   [5.] Most recent kernel version which did not have the bug:
>
>   4.4.0
>
>   [6.] Output of Oops.. message (if applicable) with symbolic information
>        resolved (see Documentation/admin-guide/oops-tracing.rst)
>
>   Attached in the below mail file named error_log.txt
>
>   [8.1.] Software (add the output of the ver_linux script here)
>
>   Attached in the below mail file named software_version.txt
>
>   [8.2.] Processor information (from /proc/cpuinfo):
>
>   Attached in the below mail file named cpu_config.txt
>
>   [8.3.] Module information (from /proc/modules):
>
>   Attached in the below mail file named modules_config.txt
>
>   [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
>
>   Attached in the below mail file named ioports_config.txt,iomem_config.txt,
>
>   [8.5.] PCI information ('lspci -vvv' as root)
>
>   Attached in the below mail file named pci_config.txt
>
>   [8.6.] SCSI information (from /proc/scsi/scsi)
>
>   Attached in the below mail file named cpu_config.txt
>
>   [X.] Other notes, patches, fixes, workarounds:
>
>   A reboot fixes the issue.
>
>   All Files are compressed in the tar and sent.
>   Let me know what went wrong and how can i fix it.
>   Let me know if any further information is required.
>
>   Thanking You.
>
>   --
>   Regards,
>   Anil Nair
>

I have the same issue with ath10k and kernel 4.13.10.
If I suspend the system when the card is up it won't work anymore
until I rmmod and modprobe ath10k_pci again.
rmmod after suspend can take up to 10 minutes and sometimes crashes the system.
Removing the driver _before_ suspend and inserting it back after
resume actually works and it's what I'm using as not-so-temporary
workaround.

Regards,
-- 
Matteo Croce
per aspera ad upstream

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
